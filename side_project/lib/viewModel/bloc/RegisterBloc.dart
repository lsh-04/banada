import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/repository/MyProfileRepository.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/event/MyProfileEvent.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late ApiController apiController;
  final MyProfileBloc myProfileBloc;
  RegisterBloc({required this.myProfileBloc}) : super(InitRegisterState()) {
    //회원가입 상태 이벤트
    on<RegisterStatusEvent>(_registerStatisEvent);
  }

  _registerStatisEvent(event, emit) async {
    apiController = new ApiController<LoadMyProfileEvent>();

    // profile/my 요청 -> 현재 프로필을 가져옴
    final response = await apiController.apiCategorize();

    //401: 토큰 만료 됨
    if (response.statusCode == 401) {
      print("토큰 만료 -> 로그인");

      //로그인 해야함
      emit(RenewRegisterState(page: 0, register: false));
    } else if (response.statusCode == 200) {
      // profile/my 요청 했으니 상태 관리를 같이 해 주면서 회원가입을 진행
      try {
        //Repository로 상태 갱신 -> 데이터가 빈 상태
        myProfileBloc.add(ReigsterMyProfileEvent(
            myProfileRepository: MyProfileRepository.of(
                data: ProfileModel.fromJson(response.data),
                phone_number: false)));
      } catch (e) {
        print(e);
        print(
            "RegisterBloc -> RegisterStatusEvent -> MyProfileBloc ADD Repository error");
      }

      print(response);
    }
  }
}

@immutable
abstract class RegisterState extends Equatable {
  bool register;
  int page;

  RegisterState({required this.page, required this.register});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitRegisterState extends RegisterState {
  InitRegisterState() : super(page: 0, register: false);
}

class RenewRegisterState extends RegisterState {
  RenewRegisterState({required super.page, required super.register});
}

abstract class RegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//회원가입 상태 이벤트
class RegisterStatusEvent extends RegisterEvent {}
