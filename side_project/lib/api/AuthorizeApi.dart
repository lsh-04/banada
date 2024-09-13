import 'package:dio/dio.dart';

class AuthorizeApi {
  final Dio dio;

  AuthorizeApi({required this.dio});

  Future<Response> KakaoAuth() async {
    try {
      final response = await dio.get("v2/user/me");
      return response;
    } catch (e) {
      print(e);
      throw Exception("AuthorizeApi -> kakaoAuth 오류");
    }
  }
}
