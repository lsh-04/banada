import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:side_project/dto/TokenDto.dart';
import 'package:side_project/login/loginpage/LoginPage1_TOS.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

class KakaoLoginWebView extends StatefulWidget {
  const KakaoLoginWebView({super.key});

  @override
  State<KakaoLoginWebView> createState() => _KakaoLoginWebViewState();
}

class _KakaoLoginWebViewState extends State<KakaoLoginWebView> {
  final FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  late final WebViewController _controller;
  final Dio dio = new Dio(BaseOptions(
      //http://10.0.2.2:8000/api/v1/
      //schen
      //http://ec2-3-25-64-39.ap-southeast-2.compute.amazonaws.com/api/v1/
      ));
  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 활성화
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          // 페이지 로드 진행 상황을 표시
          print("진행: $progress%");
        },
        onNavigationRequest: (request) async {
          // 리디렉션된 URL 출력
          print("Navigating to: ${request.url}");

          // 특정 리디렉션 URL을 확인하여 해당 조건에 따라 처리
          if (request.url.contains("kakao/callback")) {
            //인증 정보 요청
            final response = await dio.get(request.url);

            //토큰 암호화 저장
            await flutterSecureStorage.write(
                key: "auth",
                value: jsonEncode(TokenDto.of(response.data).toJson()));
            print(response.data);

            // 리디렉션 후 네비게이션 중단
            getx.Get.back(result: true);
            return NavigationDecision.prevent;
          }

          // 모든 다른 URL에 대해서는 네비게이션 허용
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(
          "https://banada.duckdns.org/accounts/kakao/login/?process=login"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
