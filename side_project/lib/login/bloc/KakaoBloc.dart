import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:side_project/model/LoginModel.dart';

class KakaoBloc extends Bloc<LoginEvent, LoginState> {
  late FlutterSecureStorage flutterSecureStorage;

  KakaoBloc() : super(InitState()) {
    on<KakaoLoginEvent>((event, emit) async {
      await kakaoLogin();
    });
  }

  Future<void> kakaoLogin() async {
    flutterSecureStorage = new FlutterSecureStorage();
    OAuthToken token;
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        emit(LoginSuccessState());
        return;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          emit(LoginFailedState());
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          emit(LoginSuccessState());
          return;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          emit(LoginFailedState());
          return;
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        print("accessToken: " + token.accessToken);
        print("refreshToken: " + token.refreshToken!);
        User infor = await UserApi.instance.me();
        print("kakao_id match password: " + infor.id.toString());
        print("email: " + infor.kakaoAccount!.email!);
        print("user_id_kakao: " + infor.kakaoAccount!.profile!.nickname!);

        //저장소 전부 삭제
        //await flutterSecureStorage.deleteAll();
        print(LoginModel.build(
                platform: "kakao",
                accessToken: token.accessToken,
                refreshToken: token.refreshToken!)
            .toJson());
        await flutterSecureStorage.write(
            key: "login",
            value: jsonEncode(LoginModel.build(
                    platform: "kakao",
                    accessToken: token.accessToken,
                    refreshToken: token.refreshToken!)
                .toJson()));
        print(await flutterSecureStorage.read(key: "login"));
        emit(LoginSuccessState());
        return;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        emit(LoginFailedState());
        return;
      }
    }
  }
}

@immutable
abstract class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class KakaoLoginEvent extends LoginEvent {}

@immutable
abstract class LoginState extends Equatable {
  //카카오 로그인이 진행 됬는지 확인 -> 동의 화면으로 넘어감
  bool login;
  LoginState({required this.login});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  LoginSuccessState() : super(login: true);
}

class LoginFailedState extends LoginState {
  LoginFailedState() : super(login: false);
}

class InitState extends LoginState {
  InitState() : super(login: false);
}
