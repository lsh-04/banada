import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitState()) {
    on<KakaoLoginEvent>((event, emit) async {
      await kakaoLogin();
    });
  }

  Future<void> kakaoLogin() async {
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
        print("access Token: " + token.accessToken);
        print("refresh Token: " + token.refreshToken!);
        User infor = await UserApi.instance.me();
        print("user_id_kakao: " + infor.id.toString());
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
