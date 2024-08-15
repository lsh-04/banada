import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/login/bloc/SimulationBloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SimulationBloc? simulationBloc;
  SplashBloc({required this.simulationBloc}) : super(InitialState()) {
    try {
      if (simulationBloc != null) {
        simulationBloc!.add(LoadDataEvent());
      }
      final FlutterSecureStorage _flutterSecureStorage =
          new FlutterSecureStorage();
      final data = _flutterSecureStorage.read(key: 'login');

      emit(LoadedBlocState());
    } catch (e) {
      print(e);
      throw Exception("SplashBloc error");
    }
  }
}

//event
abstract class SplashEvent extends Equatable {}

class LoadEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class SplashState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialState extends SplashState {}

class LoadingBlocState extends SplashState {}

class LoadedBlocState extends SplashState {}

class ErrorBlocState extends SplashState {}
