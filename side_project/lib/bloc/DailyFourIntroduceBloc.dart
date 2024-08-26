import './event/DailyFourIntroduceEvent.dart';
import './state/DailyFourIntroduceState.dart';
import 'package:bloc/bloc.dart';
import '../repository/FourIntroduceRepository.dart';

class DailyFourIntroduceBloc
    extends Bloc<DailyFourIntroduceEvent, DailyFourIntroduceState> {
  late final FourIntroduceRepository _repository;
  DailyFourIntroduceBloc() : super(InitialDailyFourIntroduceState()) {
    _repository = new FourIntroduceRepository();

    //데이터 로드
    on<LoadDailyFourIntroduceEvent>(
      (event, emit) async {
        try {
          emit(LoadingDailyFourIntroduceState());
          await _repository.getData();
          emit(LoadedDailyFourIntroduceState(repository: _repository));
        } catch (e) {
          emit(ErrorDailyFourIntroduceState());
        }
      },
    );
  }
}
