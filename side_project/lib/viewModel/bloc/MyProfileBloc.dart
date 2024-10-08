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
        throw Exception("MyProfileBloc -> LoadMyProfileEvent 오류");
      }
    });

    //repository로 바로 상태 갱신 -> registerBloc
    on<ReigsterMyProfileEvent>((event, emit) async {
      emit(LoadedMyProfileState(repository: event.myProfileRepository));
    });
  }
}
