import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/login/loginpage/LoginPage1_TOS.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:get/get.dart' as getx;

class LoginMain extends StatelessWidget {
  const LoginMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78DB9B),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15.5.h,
                ),
                Container(
                  width: 21.w,
                  child: Image_Res('logo_login', 1),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Text(
                  '만나서 반가워요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.7.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),

                SizedBox(
                  height: 0.5.h,
                ),
                //애니메이션
                Text(
                  '당신이 반하는 모든 순간',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.7.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                //애니메이션
                Text(
                  '반,하다 입니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.7.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),

                SizedBox(
                  height: 26.5.h,
                ),

                //apple 로그인
                GestureDetector(
                  child: Container(
                    width: 89.w,
                    child: Image_Res('login_apple', 1),
                  ),
                ),
                SizedBox(
                  height: 1.3.h,
                ),

                //구글 로그인
                GestureDetector(
                  child: Container(
                    width: 89.w,
                    child: Image_Res('login_google', 1),
                  ),
                ),
                SizedBox(
                  height: 1.3.h,
                ),

                //카카오 로그인
                GestureDetector(
                  onTap: () {
                    getx.Get.to(() => LoginPage1_TOS(),
                        transition: getx.Transition.noTransition);
                  },
                  child: Container(
                    width: 89.w,
                    child: Image_Res('login_kakao', 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
