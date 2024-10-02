import 'package:flutter/material.dart';
import 'package:side_project/home.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;

class LoginPageLast extends StatelessWidget {
  const LoginPageLast({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
          child: PriviousAppbar(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.8.w),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Text(
                '회원가입을 완료했어요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF00C57D),
                  fontSize: 17.3.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
              SizedBox(
                height: 2.3.h,
              ),
              Text(
                '이제 반하다를 본격적으로\n시작해볼까요?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF171B1C),
                  fontSize: 19.5.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: -0.46,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 79.w,
                child: Image_Res('last', 1),
              ),
              SizedBox(
                height: 12.7.h,
              ),
              GestureDetector(
                onTap: () {
                  getx.Get.offAll(() => Home(),
                      transition: getx.Transition.noTransition);
                },
                child: Container(
                  width: double.infinity,
                  height: 7.2.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF78DB9B), //Color(0xFF999FA4)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '시작하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.3.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
