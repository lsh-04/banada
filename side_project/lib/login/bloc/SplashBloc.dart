import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/dto/AuthorizedDto.dart';
import 'package:side_project/login/bloc/SimulationBloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Dio dio = new Dio(BaseOptions(baseUrl: "https://banada.duckdns.org/"));
  final SimulationBloc? simulationBloc;
  final FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  SplashBloc({required this.simulationBloc}) : super(InitialState()) {
    on<GetAccessTokenEvent>(
      (event, emit) async {
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

        try {
          if (simulationBloc != null) {
            simulationBloc!.add(LoadDataEvent());
          }
        } catch (e) {
          print(e);
          throw Exception("SplashBloc error");
        }

        final AuthorizedDto authorizedDto =
            new AuthorizedDto(username: "bmarshall", password: "testpass");
        final response =
            await dio.post('auth/login/', data: authorizedDto.toJson());
        if (response.statusCode == 200) {
          await flutterSecureStorage.write(
              key: 'accessToken', value: jsonEncode(response.data));
          emit(LoadedBlocState());
        } else {
          throw Exception("Splash Bloc -> GetAccessTokenEvent -> post 요청 오류");
        }
      },
    );

    add(GetAccessTokenEvent());
  }
}

//event
abstract class SplashEvent extends Equatable {}

class LoadEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAccessTokenEvent extends SplashEvent {
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
