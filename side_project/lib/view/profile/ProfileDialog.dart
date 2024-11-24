import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/login/LoginMain.dart';
import 'package:side_project/viewModel/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/viewModel/bloc/SplashBloc.dart';
import 'package:side_project/viewModel/bloc/event/ReceivedMessageEvent.dart';
import 'package:side_project/viewModel/cubit/BottomNavigationBarCubit.dart';
import 'package:side_project/dto/MessageUpdateDto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/view/MainPage.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

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
            height: 22.7.h,
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
                  child: Text('정말로 로그아웃하시겠어요?'),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getx.Get.back();
                        },
                        child: Container(
                          width: 37.1.w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF999FA4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: DefaultTextStyle(
                              child: Text('아니요'),
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
                      SizedBox(
                        width: 1.8.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<SplashBloc>().add(LogOutEvent());
                          getx.Get.offAll(() => LoginMain(),
                              transition: getx.Transition.noTransition);
                        },
                        child: Container(
                          width: 37.1.w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF78DB9B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: DefaultTextStyle(
                              child: Text('로그아웃'),
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
                    ],
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

void showProfileDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.black54,
    context: context,
    builder: (BuildContext context) {
      return ProfileDialog();
    },
  );
}
