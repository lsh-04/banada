import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/core/data/LoginRoute.dart';
import 'package:side_project/view/MainPage.dart';
import 'package:side_project/login/LoginMain.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/RegisterBloc.dart';
import 'package:side_project/viewModel/bloc/state/MyProfileState.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  String hash = '';
  Future<String> getHash() async {
    final String k = await KakaoSdk.origin;
    return k;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final gethash = await getHash();
                  setState(() {
                    hash = gethash;
                  });
                },
                child: Text('키해시: ${hash}')),
            Text(
              kIsWeb ? "모바일로 접속해 주세요" : "개발 중 입니다!",
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state1) {
              return ElevatedButton(
                onPressed: () {
                  LoginRoute loginRoute = new LoginRoute();
                  getx.Get.to(loginRoute.getLoginRoute()[state1.page]!(),
                      transition: getx.Transition.noTransition);
                },
                child: Text(
                  "로그인 이동",
                  style: TextStyle(fontSize: 20.sp),
                ),
              );
            }),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                getx.Get.to(() => MainPage());
              },
              child: Text(
                "메인 페이지 이동",
                style: TextStyle(fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
