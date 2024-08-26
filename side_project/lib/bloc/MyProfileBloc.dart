import './state/MyProfileState.dart';
import './event/MyProfileEvent.dart';
import 'package:bloc/bloc.dart';
import 'package:side_project/repository/MyProfileRepository.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  late final MyProfileRepository _repository;
  MyProfileBloc() : super(InitMtProfileState()) {
    _repository = new MyProfileRepository();

    on<LoadMyProfileEvent>((event, emit) async {
      emit(LoadingMyProfileState());
      try {
        await _repository.getData();
        emit(LoadedMyProfileState(repository: _repository));
      } catch (e) {
        print(e);
        throw Exception("api 요청 오류");
      }
    });
  }
}
