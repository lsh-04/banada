import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:side_project/repository/PastMatchRepository.dart';
import 'package:side_project/viewModel/bloc/event/PastMatchEvent.dart';
import 'package:side_project/viewModel/bloc/state/PastMatchState.dart';

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
