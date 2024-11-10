import 'package:flutter/material.dart';
import 'package:side_project/login/simulations/SimulationPage.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;

class SimulationMain extends StatelessWidget {
  const SimulationMain({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.8.w),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 1.3.h,
              ),
              Text(
                '프로필 작성을 완료했어요',
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
                '이제 연애 시뮬레이션으로\n나의 연애 스타일을 알아봐요!',
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
                height: 3.5.h,
              ),
              Container(
                width: double.infinity,
                height: 8.5.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F2F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5.w,
                          child: Image_Res('point', 1),
                        ),
                        SizedBox(
                          width: 0.5.w,
                        ),
                        Text(
                          '테스트의 결과는 추후 상대방과의 관계를',
                          style: TextStyle(
                            color: Color(0xFF2E363A),
                            fontSize: 16.3.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '정의할 때 사용돼요.',
                      style: TextStyle(
                        color: Color(0xFF2E363A),
                        fontSize: 16.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                width: 79.w,
                child: Image_Res('simulation', 1),
              ),
              SizedBox(
                height: 11.7.h,
              ),
              GestureDetector(
                onTap: () {
                  getx.Get.offAll(
                      () => SimulationPage(
                            currentpage: 0,
                          ),
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
                      '테스트 하러 가기',
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
