import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/SimulationRepository.dart';

class SimulationBloc extends Bloc<SimulationEvent, SimulationState> {
  late final SimulationRepository simulationRepository;

  SimulationBloc() : super(InitialSimulationState()) {
    simulationRepository = new SimulationRepository();

    on<LoadDataEvent>(
      (event, emit) async {
        await simulationRepository.LoadData();
        emit(LoadSimulationState(simulationRepository: simulationRepository));
      },
    );
  }
}

@immutable
abstract class SimulationState extends Equatable {
  final SimulationRepository? simulationRepository;
  SimulationState({required this.simulationRepository});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialSimulationState extends SimulationState {
  InitialSimulationState() : super(simulationRepository: null);
}

class LoadSimulationState extends SimulationState {
  LoadSimulationState({required super.simulationRepository});
}

@immutable
abstract class SimulationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadDataEvent extends SimulationEvent {}
