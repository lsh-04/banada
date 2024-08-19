import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class Preparing extends StatelessWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        color: Colors.black.withOpacity(0.05),
        width: double.infinity,
        height: 100.h,
        child: Center(
          child: Container(
            height: 25.7.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 6.5.h,
                ),
                DefaultTextStyle(
                  child: Text('해당 기능은 개발 중이에요.'),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 1.3.h,
                ),
                DefaultTextStyle(
                  child: Text('향후 업데이트를 기대해 주세요.'),
                  style: TextStyle(
                    color: Color(0xFF5A6166),
                    fontSize: 16.3.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 2.8.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Container(
                      width: double.infinity,
                      height: 6.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF78DB9B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: DefaultTextStyle(
                          child: Text('확인'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.7.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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

void showPrepareDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.black54,
    context: context,
    builder: (BuildContext context) {
      return Preparing();
    },
  );
}
