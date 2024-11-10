import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/viewModel/cubit/ImageCubit.dart';

class LoginPage4_Image extends StatelessWidget {
  LoginPage4_Image({super.key});

  Future<void> _requestPermission() async {
    if (!kIsWeb) {
      if (await Permission.storage.request().isGranted) {
        // 권한이 부여됨
      } else {
        // 권한 요청 거부됨
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final int image_length = context.watch<ImageCubit>().state == null
        ? 0
        : context.watch<ImageCubit>().state!.length;
    _requestPermission();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
          child: PriviousAppbar(text: '3/3', fontsize: 18.sp, hideBack: true),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.4.h,
                ),
                Text(
                  '프로필 사진을 선택해주세요',
                  style: TextStyle(
                    color: Color(0xFF171B1C),
                    fontSize: 19.5.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 2.7.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 6.w, child: Image_Res("point_ch", 1)),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '프로필 사진 TIP',
                      style: TextStyle(
                          color: Color(0xFF41474C),
                          fontSize: 17.3.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '얼굴이 정면으로 나온 사진이 매칭이 잘 돼요.\n최소 두 장의 사진이 필요해요.',
                  style: TextStyle(
                      color: Color(0xFF5A6166),
                      fontSize: 15.5.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.2),
                ),
                BlocBuilder<ImageCubit, List<dynamic>?>(
                    builder: (context, state) {
                  if (state == null) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          onTap: context.read<ImageCubit>().pickImages,
                          child: Container(
                            width: double.infinity,
                            height: 44.5.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF74D495),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '사진 선택하기',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.5.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 5.5.h,
                        ),
                        Container(
                          height: 22.5.h,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 41.8.w,
                                        height: 22.5.h,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD1D3D4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: index >= state.length
                                            ? Center(
                                                child: Container(
                                                    width: 19.w,
                                                    child:
                                                        Image_Res('Mask', 1)),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: !kIsWeb
                                                    ? Image.file(state[index],
                                                        fit: BoxFit.cover)
                                                    : Image.memory(
                                                        state[index],
                                                        fit: BoxFit.cover,
                                                      )),
                                      ),
                                      if (index == 0) ...[
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          child: Container(
                                            width: 12.w,
                                            height: 3.h,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF78DB9B),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '대표',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.3.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                  if (index == 0) ...[
                                    SizedBox(
                                      width: 2.8.w,
                                    ),
                                  ]
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 14.3.h,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: 27.6.w,
                                    height: 14.3.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD1D3D4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: index + 2 >= state.length
                                        ? Center(
                                            child: Container(
                                                width: 15.w,
                                                child: Image_Res('Mask', 1)),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: !kIsWeb
                                                ? Image.file(state[index + 2],
                                                    fit: BoxFit.cover)
                                                : Image.memory(
                                                    state[index + 2],
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                  if (index != 2) ...[
                                    SizedBox(
                                      width: 1.8.w,
                                    ),
                                  ]
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 4.3.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<ImageCubit>().pickImages();
                          },
                          child: Container(
                            width: 45.w,
                            height: 5.3.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFF5A6166),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 4.5.w,
                                  child: Image_Res('plus', 1),
                                ),
                                SizedBox(
                                  width: 1.8.w,
                                ),
                                Text(
                                  '다시 선택하기',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.3.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        BlocBuilder<ImageCubit, List<dynamic>?>(
                            builder: (context, state) {
                          return GestureDetector(
                            onTap: () async {
                              if (image_length >= 2) {
                                await context
                                    .read<ImageCubit>()
                                    .sendImages(context);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 7.2.h,
                              decoration: ShapeDecoration(
                                color: image_length >= 2
                                    ? Color(0xFF78DB9B)
                                    : Color(0xFF999FA4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '완료',
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
                          );
                        }),
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
