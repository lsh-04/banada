import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:side_project/dto/MessageSentDto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Request_Api {
  final FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  late Dio dio;

  Future<void> GetAccessToken() async {
    final accessToken;
    try {
      accessToken = await flutterSecureStorage.read(key: 'accessToken');
    } catch (e) {
      print(e);
      throw Exception("fluttersecurestroage");
    }
    dio = new Dio(BaseOptions(
        headers: {
          'Authorization':
              'Bearer ${jsonDecode(accessToken!)['access']}', // API 키를 Authorization 헤더로 설정
        },
        validateStatus: (status) {
          return status! < 500; // 500보다 작은 상태 코드만 유효하다고 간주
        },
        //http://10.0.2.2:8000/api/v1/
        //schen
        //http://ec2-3-25-64-39.ap-southeast-2.compute.amazonaws.com/api/v1/
        baseUrl:
            "http://ec2-3-25-64-39.ap-southeast-2.compute.amazonaws.com/api/v1/"));
  }

  Future<Response> get_Request(String address) async {
    try {
      final _response = await dio.get(address);
      return _response;
    } catch (e) {
      print(e);
      throw Exception("Api 요청 오류");
    }
  }

  Future<Response> post_Request(String address, Object object) async {
    try {
      if (object is MessageSentDto) {
        final _response =
            await dio.post(data: jsonEncode(object.toJson()), address);
        return _response;
      } else {
        throw Exception("타입 에러");
      }
    } catch (e) {
      print(e);
      throw Exception("Api 요청 오류");
    }
  }

  Future<Response> get_Request_Include_param(String address, int id) async {
    try {
      final _response = await dio.get(address + '${id}/');
      print(_response);
      if (_response.statusCode == 200) {
        return _response;
      } else {
        throw Exception("Api 요청 오류");
      }
    } catch (e) {
      print(e);
      throw Exception("Api 요청 오류");
    }
  }

  Future<Response> patch_Request(
      String address, Map<String, dynamic> data, int id) async {
    final _response =
        await dio.patch(data: jsonEncode(data), address + "${id}/");

    if (_response.statusCode == 200) {
      return _response;
    } else {
      throw Exception("Api 요청 오류");
    }
  }
}
