import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:side_project/login/cubit/IntroduceCubit.dart';
import 'package:side_project/login/introduce/IntroduceDetail.dart';
import 'package:side_project/login/loginpage/LoginPageLast.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

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
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.7.w),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.8.h,
                  ),
                  Text(
                    '@@님에 대해 소개해주세요.',
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
                    height: 1.3.h,
                  ),
                  Text(
                    '아래 질문들은 필수로 적어야 해요. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5A6166),
                      fontSize: 16.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  form('반,하다를 사용하게 된 이유가 무엇인가요?', 1),
                  SizedBox(
                    height: 2.2.h,
                  ),
                  form('좋은 연인관계란 무엇이라고 생각하나요?', 2),
                  SizedBox(
                    height: 24.h,
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.1.w),
                      child: BlocBuilder<IntroduceCubit, List<String>>(
                          builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            if (state
                                .every((element) => element.length >= 40)) {
                              getx.Get.to(() => LoginPageLast(),
                                  transition: getx.Transition.noTransition);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 7.2.h,
                            decoration: ShapeDecoration(
                              color:
                                  state.every((element) => element.length >= 40)
                                      ? Color(0xFF78DB9B)
                                      : Color(0xFF999FA4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '작성 완료',
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget form(String text, int index) {
    return GestureDetector(
      onTap: () {
        getx.Get.to(
            () => IntroduceDetail(
                  text: text,
                  index: index,
                ),
            transition: getx.Transition.noTransition);
      },
      child: Container(
        width: double.infinity,
        height: 19.9.h,
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 15,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE9EBEE)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 2.2.h, right: 4.5.w, left: 4.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'unique-tag-${index}',
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF171B1C),
                    fontSize: 16.8.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
              SizedBox(
                height: 1.6.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 3.w),
                width: double.infinity,
                height: 11.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F2F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: BlocBuilder<IntroduceCubit, List<String>>(
                    builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 3,
                        state[index - 1].length == 0
                            ? '답변을 적어주세요. 자세하게 적을수록 매칭률이 높아져요.'
                            : state[index - 1],
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: !(state[index - 1].length == 0)
                              ? Colors.black
                              : Color(0xFF999FA4),
                          fontSize: 15.2.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '${state[index - 1].length == 0 ? 0 : state[index - 1].length}/500',
                          style: TextStyle(
                            color: Color(0xFFE52D21),
                            fontSize: 14.5.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
