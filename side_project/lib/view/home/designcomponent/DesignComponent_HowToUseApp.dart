import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';

class DesignComponent_HowToUseApp extends StatelessWidget {
  const DesignComponent_HowToUseApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget textWidget(String text, FontWeight fontWeight) {
      return Text(
        text,
        style: TextStyle(
            color: Color(0xFF5A6166),
            fontSize: 15.5.sp,
            fontFamily: 'Pretendard',
            fontWeight: fontWeight,
            height: 1.2),
      );
    }

    Widget textWidget_Image(String text) {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF8D8D8D),
          fontSize: 14.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          height: 1.1,
        ),
      );
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 11.3.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Container(width: 8.6.w, child: Image_Res("clock", 1)),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    width: 60.w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '하루 네 번 ', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w700, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '새로운 사람을 만날 수 있어요. (11시, 14시, 17시, 20시)',
                            style: TextStyle(
                              fontWeight: FontWeight.w500, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.3.h,
        ),
        Container(
          width: double.infinity,
          height: 11.3.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 8.5.w, child: Image_Res("heart_ch2", 1)),
                      textWidget_Image('무료')
                    ],
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          textWidget('상대에게 ', FontWeight.w500),
                          textWidget('호감 표현', FontWeight.w700),
                          textWidget('할 수 있어요.', FontWeight.w500),
                        ],
                      ),
                      Row(
                        children: [
                          textWidget('마음에 드는 반쪽에게 ', FontWeight.w500),
                          textWidget('하트', FontWeight.w700),
                          textWidget('를 보내주세요.', FontWeight.w500),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.3.h,
        ),
        Container(
          width: double.infinity,
          height: 11.3.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 8.5.w, child: Image_Res("ring_change", 1)),
                      textWidget_Image('11루비')
                    ],
                  ),
                  SizedBox(
                    width: 4.4.w,
                  ),
                  Container(
                    width: 68.w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '놓치고 싶지 않은 ', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w700, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '반쪽에게 ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '반지', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w700, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '를 보내주세요. 반지를 주고받으면, ', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w500, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '무료로 연락처 공유', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w700, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '가 가능해요.', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w500, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.3.h,
        ),
        Container(
          width: double.infinity,
          height: 11.3.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 8.5.w, child: Image_Res("chat_ch", 1)),
                      textWidget_Image('27루비')
                    ],
                  ),
                  SizedBox(
                    width: 4.4.w,
                  ),
                  Container(
                    width: 60.w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '바로 ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text: '연락처를 공유', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w700, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                          TextSpan(
                            text:
                                '하고 싶다면 메시지를 보내주세요. 하트와 반지를 보내지 않아도 메시지를 보낼 수 있어요.', // 굵게 표시할 부분
                            style: TextStyle(
                              fontWeight: FontWeight.w500, // 굵게 설정
                              fontFamily: 'Pretendard',
                              fontSize: 15.5.sp, // 반응형 크기
                              color: Color(0xFF5A6166), // 색상 설정
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.3.h,
        ),
        Container(
          width: double.infinity,
          height: 14.9.h,
          decoration: ShapeDecoration(
            color: Color(0xFF5A6166),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 8.5.w, child: Image_Res("attention_ch", 1)),
                    ],
                  ),
                  SizedBox(
                    width: 4.4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 67.3.w,
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '불쾌함을 유발할 경우 이용자를 차단/신고할 수 있어요.', // 굵게 표시할 부분
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500, // 굵게 설정
                                          fontFamily: 'Pretendard',
                                          fontSize: 15.5.sp, // 반응형 크기
                                          color: Colors.white, // 색상 설정
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '차단/신고시 반, 하다에서 검토를 통해 일시정지/영구정지를 할 수 있어요.', // 굵게 표시할 부분
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500, // 굵게 설정
                                          fontFamily: 'Pretendard',
                                          fontSize: 15.5.sp, // 반응형 크기
                                          color: Colors.white, // 색상 설정
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
