import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/dto/TokenDto.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/viewModel/bloc/RegisterBloc.dart';
import 'package:side_project/viewModel/bloc/SimulationBloc.dart';
import 'package:get/get.dart' as getx;

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Dio dio = new Dio(BaseOptions(baseUrl: "https://banada.duckdns.org/"));
  final SimulationBloc? simulationBloc;
  final RegisterBloc registerBloc;
  final FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  late ApiController apiController;
  SplashBloc({required this.simulationBloc, required this.registerBloc})
      : super(InitialState()) {
    on<Authorize>(
      (event, emit) async {
        log("로그인 1. Splash Bloc-> Authorize: 시뮬레이션 데이터 가져옴");
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
        log("로그인 2. Splash Bloc-> Authorize: registerBloc 이벤트 실행");
        registerBloc.add(RegisterStatusEvent());

        emit(LoadedBlocState());
      },
    );

    add(Authorize());

    on<LogOutEvent>((event, emit) async {
      await flutterSecureStorage.delete(key: "auth");
    });

    on<QuitEvent>((event, emit) async {
      try {
        showDialog(
          barrierDismissible: false,
          barrierColor: Colors.black54,
          context: event.context,
          builder: (BuildContext context) {
            return Loading();
          },
        );

        apiController = new ApiController<QuitEvent>(
            user_id: TokenDto.of(jsonDecode(
                    await flutterSecureStorage.read(key: "auth") ?? ""))
                .user_id);
        await apiController.apiCategorize();

        add(LogOutEvent());

        getx.Get.back();
      } catch (e) {
        log(e.toString());
        log("SplashBloc -> QuitEvent");
      }
    });
  }
}

//event
abstract class SplashEvent extends Equatable {}

class LoadEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogOutEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QuitEvent extends SplashEvent {
  BuildContext context;
  QuitEvent({required this.context});
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
