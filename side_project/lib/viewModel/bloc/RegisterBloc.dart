import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/core/data/PageList.dart';
import 'package:side_project/dto/RegisterPart1Dto.dart';
import 'package:side_project/dto/RegisterPart2Dto.dart';
import 'package:side_project/dto/TokenDto.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/repository/MyProfileRepository.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/event/MyProfileEvent.dart';
import 'dart:developer';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late ApiController apiController;
  final MyProfileBloc myProfileBloc;
  late FlutterSecureStorage flutterSecureStorage;
  late MyProfileRepository myProfileRepository;
  RegisterBloc({required this.myProfileBloc}) : super(InitRegisterState()) {
    //회원가입 상태 이벤트
    on<RegisterStatusEvent>(_registerStatusEvent);

    //회원가입 나머지 등록
    on<RegisterPart2Event>(
      (event, emit) async {
        emit(InitRegisterState());
        flutterSecureStorage = new FlutterSecureStorage();

        //인증 토큰을 가져옴
        String? getAuth = await flutterSecureStorage.read(key: "auth");

        //null이면
        if (getAuth == null) {
          throw Exception(
              "RegisterBloc -> RegisterPart2Event -> getAuth 값이 null임.");
        } else {
          TokenDto tokenDto = TokenDto.of(jsonDecode(getAuth));

          apiController = new ApiController<RegisterPart2Event>(
              profile_id: tokenDto.profile_id,
              registerPart2Dto: event.registerPart2Dto);

          try {
            final response = await apiController.apiCategorize();

            myProfileBloc.add(ReigsterMyProfileEvent(
                myProfileRepository: MyProfileRepository.of(
              data: ProfileModel.fromJson(response.data),
            )));

            //myProfileBloc 갱신
            log("myProfileBloc: " + myProfileBloc.state.toString());

            emit(RenewRegisterState(
                page: PageList.LoginPage3_ProfileWrite2, register: false));
          } catch (e) {
            log(e.toString());
            throw Exception(
                "RegisterBloc -> RegisterPart2Event -> api Request");
          }
        }
      },
    );

    //회원가입(닉네임, 지역) 등록
    on<RegisterPart1Event>(_registerPart1Event);

    //만료
    on<ExpireEvent>((event, emit) {
      emit(ErrorRegisterState());
    });
  }

  _registerPart1Event(event, emit) async {
    emit(InitRegisterState());
    flutterSecureStorage = new FlutterSecureStorage();

    //인증 토큰을 가져옴
    String? getAuth = await flutterSecureStorage.read(key: "auth");

    //null이면
    if (getAuth == null) {
      throw Exception(
          "RegisterBloc -> RegisterPart1Event -> getAuth 값이 null임.");
    } else {
      TokenDto tokenDto = TokenDto.of(jsonDecode(getAuth));

      apiController = new ApiController<RegisterPart1Event>(
          profile_id: tokenDto.profile_id,
          registerPart1Dto: event.registerPart1Dto);

      try {
        final response = await apiController.apiCategorize();

        log("response: " + response.data.toString());

        myProfileBloc.add(ReigsterMyProfileEvent(
            myProfileRepository: MyProfileRepository.of(
                data: ProfileModel.fromJson(response.data))));

        //myProfileBloc 갱신
        log("myProfileBloc: " + myProfileBloc.state.toString());

        emit(RenewRegisterState(
            page: PageList.LoginPage3_ProfileWrite2, register: false));
      } catch (e) {
        log(e.toString());
        throw Exception("RegisterBloc -> RegisterPart1Event -> api Request");
      }
    }
  }

  _registerStatusEvent(event, emit) async {
    log("로그인 3. Register Bloc-> registerStatusEvent: profile/my 요청 -> 현재 프로필을 가져옴");

    myProfileRepository = new MyProfileRepository();
    ProfileModel _myprofile;
    try {
      //myProfileRepository -> getData myprofile 조회
      await myProfileRepository.getData();

      _myprofile = myProfileRepository.data;

      //accessToken 가져오기
      FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();

      String? getAuth = await flutterSecureStorage.read(key: "auth");
      log("Auth: " + getAuth!);

      // profile/my 요청 했으니 상태 관리를 같이 해 주면서 회원가입을 진행
      //ProfileModel로 형변환
      try {
        myProfileBloc.add(
            ReigsterMyProfileEvent(myProfileRepository: myProfileRepository));

        log("로그인 4. Register Bloc-> registerStatusEvent: 나의 프로필을 가져옴");
        log(_myprofile.toString());

        //nickname, region 등록 완료 -> write2로 이동
        if (_myprofile.nickname == null && _myprofile.residence!.isEmpty) {
          log("로그인 5. Register Bloc-> registerStatusEvent: LoginPage1_TOS로 이동");
          //프로필 작성 2
          emit(RenewRegisterState(
              page: PageList.LoginPage1_TOS, register: false));
        } else if (_myprofile.height == null &&
            _myprofile.job!.isEmpty &&
            _myprofile.religion!.isEmpty &&
            _myprofile.drinking_frequency!.isEmpty) {
          log("5. Register Bloc-> registerStatusEvent: LoginPage3_ProfileWrite2로 이동");
          emit(RenewRegisterState(
              page: PageList.LoginPage3_ProfileWrite2, register: false));
        } else if (_myprofile.images.isEmpty) {
          log("로그인 5. Register Bloc-> registerStatusEvent: LoginPage4_Image로 이동");
          emit(RenewRegisterState(
              page: PageList.LoginPage4_Image, register: false));
        } else if (_myprofile.answers.length == 0) {
          log("로그인 5. Register Bloc-> registerStatusEvent: SimulationMain로 이동");
          emit(RenewRegisterState(
              page: PageList.SimulationMain, register: false));
        } else if (_myprofile.answers.length < 16) {
          emit(RenewRegisterState(
              page: PageList.SimulationPage, register: false));
        } else {
          emit(RenewRegisterState(page: PageList.Main, register: true));
        }

        log("nickName: " + myProfileRepository.data.nickname.toString());
        log("contacts: " + myProfileRepository.contacts.toString());
      } catch (e) {
        emit(ErrorRegisterState());
        log(e.toString());
        log("로그인 5. RegisterBloc -> RegisterStatusEvent : Error -> ErrorRegisterState 상태 변경");
      }
    } catch (e) {
      log(e.toString());
      log("로그인 4. Register Bloc-> registerStatusEvent: 토큰 만료 -> 로그인");

      //로그인 해야함
      emit(ErrorRegisterState());
    }
  }
}

@immutable
abstract class RegisterState extends Equatable {
  bool register;
  PageList page;

  RegisterState({required this.page, required this.register});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitRegisterState extends RegisterState {
  InitRegisterState() : super(page: PageList.LoginMain, register: false);
}

class RenewRegisterState extends RegisterState {
  RenewRegisterState({required super.page, required super.register});
}

class ErrorRegisterState extends RegisterState {
  ErrorRegisterState() : super(page: PageList.LoginMain, register: false);
}

abstract class RegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ExpireEvent extends RegisterEvent {}

//회원가입 상태 이벤트
class RegisterStatusEvent extends RegisterEvent {}

//회원가입 (닉네임, 지역 등록)
class RegisterPart1Event extends RegisterEvent {
  final RegisterPart1Dto registerPart1Dto;

  RegisterPart1Event({required this.registerPart1Dto});
}

//회원가입 (나머지 등록)
class RegisterPart2Event extends RegisterEvent {
  final RegisterPart2Dto registerPart2Dto;

  RegisterPart2Event({required this.registerPart2Dto});
}
