import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/controller/ApiController.dart';
import 'dart:developer';

class NickNameValidBloc extends Bloc<NickNameEvent, NickNameValidState> {
  late ApiController apiController;
  NickNameValidBloc() : super(InitNickNameValidState()) {
    //닉네임 유효성 판별
    on<NickNameValidEvent>(_nickNameValidEvent);

    //닉네임 유효성 초기화
    on<InitNickNameValidEvent>(_initNickNameValidEvent);
  }

  //닉네임 유효성 초기화
  _initNickNameValidEvent(event, emit) {
    emit(InitNickNameValidState());
  }

  //닉네임 유효성 판별
  _nickNameValidEvent(event, emit) async {
    emit(LoadingNickNameValidState());
    apiController = new ApiController<NickNameValidEvent>(
        param: {"nickname": event.nickname});

    try {
      final response = await apiController.apiCategorize();
      log(response.toString());
      if (response.data["message"] == "확인되었습니다.") {
        emit(PossibleNickNameValidState());
      } else {
        emit(DuplicationNickNameValidState());
      }
    } catch (e) {
      log(e.toString());
      Exception(
          "NickNameValidBloc -> NickNameValidEvent -> _nickNameValidEvent");
    }
  }
}

//닉네임 이벤트
abstract class NickNameEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//닉네임 유효성 판별 이벤트
class NickNameValidEvent extends NickNameEvent {
  final String nickname;
  NickNameValidEvent({required this.nickname});
}

//닉네임 유효성 초기화
class InitNickNameValidEvent extends NickNameEvent {}

//닉네임 유효성 state
abstract class NickNameValidState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitNickNameValidState extends NickNameValidState {}

//로딩
class LoadingNickNameValidState extends NickNameValidState {}

//중복
class DuplicationNickNameValidState extends NickNameValidState {}

//가능
class PossibleNickNameValidState extends NickNameValidState {}
