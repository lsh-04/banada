import 'dart:developer';
import 'package:get/get.dart' as getx;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/dto/SimulationDto.dart';
import 'package:side_project/repository/SimulationRepository.dart';
import 'package:side_project/view/loading/Loading.dart';

class SimulationBloc extends Bloc<SimulationEvent, SimulationState> {
  late final SimulationRepository simulationRepository;
  late ApiController apiController;
  SimulationBloc() : super(InitialSimulationState()) {
    simulationRepository = new SimulationRepository();

    on<LoadDataEvent>(
      (event, emit) async {
        await simulationRepository.LoadData();
        emit(LoadSimulationState(simulationRepository: simulationRepository));
      },
    );

    on<RegisterSimulationEvent>((event, emit) async {
      apiController = new ApiController<RegisterSimulationEvent>(
          simulationDto: event.simulationDto);
      try {
        getx.Get.dialog(
          Loading(),
          barrierColor: Colors.black12,
          barrierDismissible: false,
        );
        await apiController.apiCategorize();
        getx.Get.back();
      } catch (e) {
        log(e.toString());
        log("SimulationBloc -> RegisterSimulationEvent Error");
      }
    });
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

class RegisterSimulationEvent extends SimulationEvent {
  SimulationDto simulationDto;
  RegisterSimulationEvent({required this.simulationDto});
}
