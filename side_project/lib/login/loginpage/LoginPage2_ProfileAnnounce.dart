import 'package:flutter/material.dart';
import 'package:side_project/login/loginpage/LoginPage3_ProfileWrite1.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;

class LoginPage2_ProfileAnnounce extends StatelessWidget {
  const LoginPage2_ProfileAnnounce({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
            child: PriviousAppbar(hideBack: true),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 6.5.h,
              ),
              Text(
                '이제 프로필을 작성해볼까요?',
                style: TextStyle(
                  color: Color(0xFF171B1C),
                  fontSize: 19.5.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              SizedBox(
                height: 11.5.h,
              ),
              Container(
                width: 79.w,
                child: Image_Res('profileAnnounce', 1),
              ),
              SizedBox(
                height: 15.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                child: GestureDetector(
                  onTap: () {
                    getx.Get.offAll(() => LoginPage3_ProfileWrite1(),
                        transition: getx.Transition.noTransition);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.2.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF78DB9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '프로필 작성하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.3.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1.2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
