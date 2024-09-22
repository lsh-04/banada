import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class KakaoLoginWebView extends StatefulWidget {
  const KakaoLoginWebView({super.key});

  @override
  State<KakaoLoginWebView> createState() => _KakaoLoginWebViewState();
}

class _KakaoLoginWebViewState extends State<KakaoLoginWebView> {
  late final WebViewController _controller;
  final Dio dio = new Dio(BaseOptions(
      //http://10.0.2.2:8000/api/v1/
      //schen
      //http://ec2-3-25-64-39.ap-southeast-2.compute.amazonaws.com/api/v1/
      baseUrl: "https://banada.duckdns.org/api/v1/"));
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
            // 리디렉션된 URL에 포함된 코드를 사용해 인증 처리
            Uri uri = Uri.parse(request.url);
            String? code = uri.queryParameters['code'];
            if (code != null) {
              print("Authorization code: $code");
              // 여기서 인증 코드 처리 (ex: 서버로 전송)
            }

            Get.back();
            // 리디렉션 후 네비게이션 중단
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
