import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/repository/OtherProfilesRepository.dart';

class OtherProfilesBloc extends Bloc<OtherProfilesEvent, OtherProfilesState> {
  late OtherProfilesRepository repository;

  OtherProfilesBloc() : super(InitOtherProfilesState()) {
    on<LoadOtherProfilesEvent>((event, emit) async {
      repository = new OtherProfilesRepository(id: event.id);
      try {
        emit(LoadingOtherProfilesState());
        await repository.getData();
        emit(LoadedOtherProfilesState(repository: repository));
      } catch (e) {
        print(e);
        emit(ErrorOtherProfilesState());
      }
    });
  }
}

//event
abstract class OtherProfilesEvent extends Equatable {}

class LoadOtherProfilesEvent extends OtherProfilesEvent {
  final int id;
  LoadOtherProfilesEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class OtherProfilesState extends Equatable {
  final OtherProfilesRepository? repository;

  const OtherProfilesState({required this.repository});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitOtherProfilesState extends OtherProfilesState {
  InitOtherProfilesState() : super(repository: null);
}

class LoadingOtherProfilesState extends OtherProfilesState {
  LoadingOtherProfilesState() : super(repository: null);
}

class LoadedOtherProfilesState extends OtherProfilesState {
  LoadedOtherProfilesState({required super.repository});
}

class ErrorOtherProfilesState extends OtherProfilesState {
  ErrorOtherProfilesState() : super(repository: null);
}
