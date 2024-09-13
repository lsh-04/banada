import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/controller/LoginController.dart';
import 'package:side_project/dto/AuthLoginDto.dart';
import 'package:side_project/dto/AuthSignDto.dart';
import 'package:side_project/login/bloc/SimulationBloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Dio dio = new Dio(BaseOptions(
    baseUrl: "https://banada.duckdns.org/",
    validateStatus: (status) {
      return status! < 500; // 500보다 작은 상태 코드만 유효하다고 간주
    },
  ));
  final SimulationBloc? simulationBloc;
  late LoginController loginController;
  final FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  SplashBloc({required this.simulationBloc}) : super(InitialState()) {
    loginController = new LoginController();
    on<AutoLoginEvent>(
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

        final authInfor = await flutterSecureStorage.read(key: "login");
        //authInfor가 null이면 회원가입 해야함!
        if (authInfor.isNull) {
          emit(SignBlocState());
        } else {
          //플랫폼 로그인 인증
          Map<String, dynamic> response =
              (await loginController.apiCategorize()).data;
          print("======== 플랫폼 인증 =======");
          print(response);

          //본 서버 로그인 인증
          print("======= 본 서버 인증 =======");
          print(
              "${response["properties"]["nickname"]} ${response["id"]} ${response["kakao_account"]["email"]}");
          final response_auth_login = await dio.post(
            "auth/login/",
            data: jsonEncode(AuthLoginDto.build(
                    username: response["properties"]["nickname"],
                    email: response["kakao_account"]["email"],
                    password: response["id"].toString())
                .toJson()),
          );

          print(response_auth_login.statusCode);
          if (response_auth_login.statusCode == 200) {
          } else if (response_auth_login.statusCode == 400) {
            // 자동 회원가입
            final response_auth_sign = await dio.post(
              "auth/registration/",
              data: jsonEncode(AuthSignDto.build(
                  username: response["properties"]["nickname"],
                  email: response["kakao_account"]["email"],
                  //수정 필요함
                  password1: response["id"].toString() + "D^",
                  password2: response["id"].toString() + "D^")),
            );

            print(response_auth_sign);
          }

          emit(LoginBlocState());
        }
      },
    );

    add(AutoLoginEvent());
  }
}

//event
abstract class SplashEvent extends Equatable {}

class LoadEvent extends SplashEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AutoLoginEvent extends SplashEvent {
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

class LoginBlocState extends SplashState {}

class SignBlocState extends SplashState {}

class ErrorBlocState extends SplashState {}
