import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/home.dart';
import 'package:side_project/login/LoginMain.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kIsWeb ? "모바일로 접속해 주세요" : "개발 중 입니다!",
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                getx.Get.to(() => LoginMain());
              },
              child: Text(
                "로그인 이동",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                getx.Get.to(() => Home());
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
