import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:side_project/viewModel/bloc/RegisterBloc.dart';
import 'package:side_project/viewModel/bloc/SimulationBloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Dio dio = new Dio(BaseOptions(baseUrl: "https://banada.duckdns.org/"));
  final SimulationBloc? simulationBloc;
  final RegisterBloc registerBloc;
  final FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  SplashBloc({required this.simulationBloc, required this.registerBloc})
      : super(InitialState()) {
    on<Authorize>(
      (event, emit) async {
        //웹 일시 처리
        if (kIsWeb) {
          try {
            if (simulationBloc != null) {
              simulationBloc!.add(LoadDataEvent());
            }
          } catch (e) {
            print(e);
            throw Exception("SplashBloc error");
          }

          return;
        }

        //시뮬레이션 데이터 가져오기
        try {
          if (simulationBloc != null) {
            simulationBloc!.add(LoadDataEvent());
          }
        } catch (e) {
          print(e);
          throw Exception("SplashBloc error");
        }

        //registerBloc 이벤트 실행
        registerBloc.add(RegisterStatusEvent());

        emit(LoadedBlocState());
      },
    );

    add(Authorize());
  }
}

//event
abstract class SplashEvent extends Equatable {}

class LoadEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Authorize extends SplashEvent {
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
