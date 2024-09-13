import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:side_project/api/AuthorizeApi.dart';
import 'package:side_project/model/LoginModel.dart';

@immutable
class LoginController {
  late FlutterSecureStorage flutterSecureStorage;
  late AuthorizeApi authorizeApi;
  LoginController() {
    flutterSecureStorage = new FlutterSecureStorage();
  }

  Future<Response> apiCategorize() async {
    try {
      //유저 정보 가져오기
      String? saveUser = await flutterSecureStorage.read(key: "login");
      LoginModel user = LoginModel.fromJson(jsonDecode(saveUser!));
      print(user);

      //요청하기
      switch (user.platform) {
        case "kakao":
          authorizeApi = new AuthorizeApi(
              dio: new Dio(BaseOptions(
                  headers: {
                'Authorization':
                    'Bearer ${user.accessToken}', // API 키를 Authorization 헤더로 설정
              },
                  validateStatus: (status) {
                    return status! < 500; // 500보다 작은 상태 코드만 유효하다고 간주
                  },
                  baseUrl: "https://kapi.kakao.com/")));
          final response = await authorizeApi.KakaoAuth();
          return response;

        default:
          throw Exception("LoginController -> apiCategorize() -> switch 예외");
      }
    } catch (e) {
      print(e);
      throw Exception("LoginController -> apiCategorize() 오류");
    }
  }
}
