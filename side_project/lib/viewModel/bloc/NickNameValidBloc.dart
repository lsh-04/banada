import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:side_project/controller/ApiController.dart';
import 'dart:developer';

class ErrorNickNameValidState extends NickNameValidState {
  final String errorMessage;
  ErrorNickNameValidState(this.errorMessage);
}

class NickNameValidBloc extends Bloc<NickNameEvent, NickNameValidState> {
  late ApiController apiController;
  CancelableOperation<void>? _currentOperation;

  NickNameValidBloc() : super(InitNickNameValidState()) {
    on<NickNameValidEvent>(_nickNameValidEvent);
    on<InitNickNameValidEvent>(_initNickNameValidEvent);
  }

  // 닉네임 유효성 초기화
  void _initNickNameValidEvent(event, emit) {
    // 진행 중인 요청이 있다면 취소
    _currentOperation?.cancel();
    emit(InitNickNameValidState());
  }

  // 닉네임 유효성 판별
  Future<void> _nickNameValidEvent(event, emit) async {
    // 이전 요청이 있다면 취소
    _currentOperation?.cancel();

    emit(LoadingNickNameValidState());

    // 새로운 비동기 작업 시작
    apiController = ApiController<NickNameValidEvent>(
      param: {"nickname": event.nickname},
    );

    _currentOperation = CancelableOperation.fromFuture(
      apiController.apiCategorize(),
      onCancel: () => print("닉네임 유효성 검사 취소됨"),
    );

    try {
      final response = await _currentOperation!.value as Response;
      log(response.toString());

      if (response.data["message"] == "확인되었습니다.") {
        emit(PossibleNickNameValidState());
      } else {
        emit(DuplicationNickNameValidState());
      }
    } catch (e) {
      log(e.toString());
      emit(ErrorNickNameValidState("유효성 검사 중 오류가 발생했습니다."));
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
