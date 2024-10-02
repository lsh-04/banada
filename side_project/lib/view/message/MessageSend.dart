import 'package:flutter/material.dart';
import 'package:side_project/home.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/message/MessageProfile.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 18.3.h,
            ),
            Container(
              width: 43.w,
              child: Image_Res("messageSend", 1),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '마카롱님에게\n메시지를 보냈어요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 19.5.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 2.3.h,
            ),
            Text(
              '상대방이 수락하면 알려드릴게요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 17.3.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: GestureDetector(
                onTap: () {
                  getx.Get.offAll(() => Home(),
                      transition: getx.Transition.noTransition);
                },
                child: Container(
                  width: double.infinity,
                  height: 7.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF02D289),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '돌아가기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
