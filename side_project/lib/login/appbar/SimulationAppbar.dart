import 'package:flutter/material.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SimulationAppbar extends StatelessWidget {
  final double progressValue;
  final String text;
  final String subtext;
  const SimulationAppbar(
      {super.key,
      required this.progressValue,
      required this.text,
      required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
          child: PriviousAppbar(
            text: '연애 시뮬레이션',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1.7.h),
        child: Container(
          width: double.infinity,
          height: 10.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF171B1C),
                      fontSize: 17.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    subtext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5A6166),
                      fontSize: 17.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                width: 50.w,
                child: LinearProgressIndicator(
                  value: progressValue, // 프로그래스 바의 현재 값
                  backgroundColor: Colors.grey[200],
                  color: Color(0xFF02D289),
                  minHeight: 0.6.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
