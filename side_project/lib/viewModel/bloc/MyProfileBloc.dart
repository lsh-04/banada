import 'dart:developer';

import 'package:side_project/controller/ApiController.dart';

import './state/MyProfileState.dart';
import './event/MyProfileEvent.dart';
import 'package:bloc/bloc.dart';
import 'package:side_project/repository/MyProfileRepository.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  late ApiController apiController;
  late final MyProfileRepository _repository;
  MyProfileBloc() : super(InitMyProfileState()) {
    _repository = new MyProfileRepository();

    on<LoadMyProfileEvent>((event, emit) async {
      emit(LoadingMyProfileState());
      try {
        await _repository.getData();
        emit(LoadedMyProfileState(repository: _repository));
      } catch (e) {
        emit(ErrorMyProfileState());
        print(e);
        throw Exception("MyProfileBloc -> LoadMyProfileEvent 오류");
      }
    });

    //repository로 바로 상태 갱신 -> registerBloc
    on<ReigsterMyProfileEvent>((event, emit) async {
      emit(LoadedMyProfileState(repository: event.myProfileRepository));
    });

    //contacts 등록
    on<RegisterPhoneEvent>((event, emit) async {
      apiController =
          new ApiController<RegisterPhoneEvent>(contactsDto: event.contactsDto);
      try {
        final response = await apiController.apiCategorize();

        if (response.statusCode == 400) {
          emit(ErrorMyProfileState());
        } else {
          emit(LoadingMyProfileState());
          add(LoadMyProfileEvent());
        }
        log(state.toString());
        log(response.toString());
        log(response.statusCode.toString());
      } catch (e) {
        log(e.toString());
        throw Exception(
            "MyProfileBloc -> RegisterPhoneEvent -> response api request");
      }
    });
  }
}
