import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/login/bloc/KakaoBloc.dart';
import 'package:side_project/login/loginpage/LoginPage1_TOS.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:get/get.dart' as getx;

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> with TickerProviderStateMixin {
  late List<AnimationController> controllers;
  late List<Animation<double>> animations;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
        3,
        (index) => AnimationController(
              duration: const Duration(milliseconds: 1100),
              vsync: this,
            ));

    animations = new List.generate(
        3, (index) => Tween(begin: 0.0, end: 1.0).animate(controllers[index]));

    // Start the animations with delays
    controllers[0].forward().then((_) {
      controllers[1].forward().then((_) {
        controllers[2].forward();
      });
    });
  }

  @override
  void dispose() {
    for (var a in controllers) {
      a.dispose();
    }
    super.dispose();
  }

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
                  width: 23.w,
                  child: Image_Res('logo_login', 1),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                FadeTransition(
                  opacity: animations[0],
                  child: Text(
                    '만나서 반가워요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
                ),

                SizedBox(
                  height: 0.5.h,
                ),
                //애니메이션
                FadeTransition(
                  opacity: animations[1],
                  child: Text(
                    '당신이 반하는 모든 순간',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                //애니메이션
                FadeTransition(
                  opacity: animations[2],
                  child: Text(
                    '반,하다 입니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
                ),

                SizedBox(
                  height: 26.5.h,
                ),

                //apple 로그인
                GestureDetector(
                  child: Container(
                    width: 87.w,
                    child: Image_Res('login_apple', 1),
                  ),
                ),
                SizedBox(
                  height: 1.3.h,
                ),

                //구글 로그인
                GestureDetector(
                  child: Container(
                    width: 87.w,
                    child: Image_Res('login_google', 1),
                  ),
                ),
                SizedBox(
                  height: 1.3.h,
                ),

                //카카오 로그인
                BlocListener<KakaoBloc, LoginState>(
                  listener: (context, state) {
                    if (state.login) {
                      getx.Get.to(() => LoginPage1_TOS(),
                          transition: getx.Transition.noTransition);
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      //웹 일시 인증 건너뜀.
                      if (kIsWeb) {
                        getx.Get.to(() => LoginPage1_TOS(),
                            transition: getx.Transition.noTransition);
                        return;
                      }
                      context.read<KakaoBloc>().add(KakaoLoginEvent());
                    },
                    child: Container(
                      width: 87.w,
                      child: Image_Res('login_kakao', 1),
                    ),
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
