import 'package:bloc/bloc.dart';
import 'package:side_project/bloc/event/PastMatchEvent.dart';
import 'package:side_project/bloc/state/PastMatchState.dart';
import 'package:side_project/repository/PastMatchRepository.dart';

class PastMatchBloc extends Bloc<PastMatchEvent, PastMatchState> {
  late PastMatchRepository pastMatchRepository;
  PastMatchBloc() : super(InitPastMatchState()) {
    pastMatchRepository = new PastMatchRepository();
    on<LoadPastMatchEvent>((event, emit) async {
      try {
        emit(LoadingPastMatchState());
        await pastMatchRepository.getDatas();
        emit(LoadedPastMatchState(pastMatchRepository: pastMatchRepository));
      } catch (e) {
        print(e);
        throw Exception("PastMatchBloc");
      }
    });
  }
}
