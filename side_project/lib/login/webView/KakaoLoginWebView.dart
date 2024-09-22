import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoLoginWebView extends StatelessWidget {
  const KakaoLoginWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final WebViewController _controller = new WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          print("진행: ${progress}");
        },
        onNavigationRequest: (request) {
          print(Uri.parse(request.url));
          return NavigationDecision.prevent;
        },
      ))
      ..loadRequest(Uri.parse(
          "https://banada.duckdns.org/accounts/kakao/login/?process=login"));

    return Scaffold(
      appBar: AppBar(
        title: Text('카카오 로그인'),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
