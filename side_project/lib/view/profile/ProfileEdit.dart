import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/view/etc/Preparing.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/state/MyProfileState.dart';
import 'package:side_project/viewModel/cubit/ImageCubit.dart';
import 'package:get/get.dart' as getx;

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    //profile 컴포넌트
    Widget Component_profile(int index, String text, String subtext) {
      return Container(
        width: double.infinity,
        height: 8.h,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${text}',
                  style: TextStyle(
                    color: Color(0xFF1E2427),
                    fontSize: 17.3.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '${subtext}',
                  style: TextStyle(
                    color: Color(0xFF999FA4),
                    fontSize: 16.3.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (index == 0 || index == 1) {
                  showPrepareDialog(context);
                }
              },
              child: Container(
                width: index == 0 || index == 1 ? 22.w : 7.w,
                child: Image_Res(
                    index == 0 || index == 1 ? 'change_profile' : 'arrow_down',
                    1),
              ),
            ),
          ],
        ),
      );
    }

    void showAgainDialog(BuildContext context) {
      showDialog(
        barrierColor: Colors.black54,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Container(
              color: Colors.black.withOpacity(0.05),
              width: double.infinity,
              child: Center(
                child: Container(
                  height: 20.7.h,
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
                        child: Text('최소 2개 이상 선택해 주세요!'),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 2.8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          getx.Get.back();
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
        },
      );
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffF2F3F4),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(5.h),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
                child: PriviousAppbar(
                  text: '프로필 수정',
                  fontsize: 18.sp,
                  color: Color(0xffF2F3F4),
                ),
              ),
            ),
            body: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: BlocBuilder<MyProfileBloc, MyProfileState>(
                      builder: (context, state) {
                    ProfileModel data = state.repository!.data;

                    Map<String, String> map = {
                      "닉네임": data.nickname!,
                      "키": data.height.toString() + "CM",
                      "거주지": data.residence!,
                      "직업": data.job!,
                      "흡연 여부": data.is_smoke! ? "흡연 O" : "흡연 X",
                      "음주 빈도": data.drinking_frequency!,
                      "종교": data.religion!
                    };
                    if (state is LoadedMyProfileState) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 32.8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.1.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    '프로필 사진',
                                    style: TextStyle(
                                      color: Color(0xFF1E2427),
                                      fontSize: 17.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    height: 14.3.h,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          state.repository!.data.images.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return Stack(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 27.6.w,
                                                    height: 14.3.h,
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFFD1D3D4),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // Container와 동일한 둥근 모서리
                                                      child: Image.network(
                                                        state
                                                            .repository!
                                                            .data
                                                            .images[index]
                                                            .image,
                                                        fit: BoxFit
                                                            .cover, // 이미지가 컨테이너를 채우도록 설정
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 1.8.w,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 1.h),
                                                child: Container(
                                                  width: 10.w,
                                                  height: 2.2.h,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF78DB9B),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '대표',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.3.sp,
                                                          fontFamily:
                                                              'Pretendard',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Row(
                                            children: [
                                              Container(
                                                width: 27.6.w,
                                                height: 14.3.h,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFD1D3D4),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Container와 동일한 둥근 모서리
                                                  child: Image.network(
                                                    state.repository!.data
                                                        .images[index].image,
                                                    fit: BoxFit
                                                        .cover, // 이미지가 컨테이너를 채우도록 설정
                                                  ),
                                                ),
                                              ),
                                              if (index !=
                                                  state.repository!.data.images
                                                          .length -
                                                      1) ...[
                                                SizedBox(
                                                  width: 1.8.w,
                                                ),
                                              ]
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  BlocBuilder<ImageCubit, List<dynamic>?>(
                                      builder: (context, state) {
                                    return GestureDetector(
                                      onTap: () async {
                                        showPrepareDialog(context);
                                        // await context
                                        //     .read<ImageCubit>()
                                        //     .pickImages();
                                        // if (context
                                        //             .read<ImageCubit>()
                                        //             .state!
                                        //             .length <
                                        //         2 ||
                                        //     context
                                        //             .read<ImageCubit>()
                                        //             .state!
                                        //             .length >
                                        //         5) {
                                        //   showAgainDialog(context);
                                        // } else {
                                        //   await context
                                        //       .read<ImageCubit>()
                                        //       .sendImages(context);
                                        //   getx.Get.back();
                                        // }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 6.2.h,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF78DB9B),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '수정하기',
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
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 75.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(
                                    '기본 정보',
                                    style: TextStyle(
                                      color: Color(0xFF1E2427),
                                      fontSize: 17.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      physics:
                                          NeverScrollableScrollPhysics(), // ListView 스크롤 비활성화
                                      itemCount: map.values.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Component_profile(
                                                index,
                                                map.keys.toList()[index],
                                                map.values.toList()[index],
                                              ),
                                            ),
                                            if (index !=
                                                map.values.length - 1) ...[
                                              Divider(
                                                thickness: 0.5,
                                              ),
                                            ]
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.5.h,
                          ),
                        ],
                      );
                    } else {
                      return Loading();
                    }
                  }),
                ),
              ),
            )));
  }
}
