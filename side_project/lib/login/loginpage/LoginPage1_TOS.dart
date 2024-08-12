import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/login/loginpage/LoginPage2_ProfileAnnounce.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:get/get.dart' as getx;

class LoginPage1_TOS extends StatefulWidget {
  const LoginPage1_TOS({super.key});

  @override
  State<LoginPage1_TOS> createState() => _LoginPage1_TOSState();
}

class _LoginPage1_TOSState extends State<LoginPage1_TOS> {
  final List<bool> check_list = List.generate(6, (i) => false);
  bool check() {
    for (int a = 0; a < check_list.length; a++) {
      if (a == check_list.length - 1) {
        break;
      }
      if (!check_list[a]) {
        return false;
      }
    }
    return true;
  }

  final List<String> _titles = [
    '이용약관 동의',
    '개인정보 수집 및 이용 동의',
    '위치정보 이용약관 동의',
    '민감정보 이용 동의',
    '마케팅 수신 동의(선택)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              '약관 동의가 필요해요',
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 19.5.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 3.8.h),
            Container(
              height: 7.3.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Color(0xFFF7F8F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: GestureDetector(
                  onTap: () {
                    //상태관리 할 필요없음
                    setState(() {
                      if (check_list[check_list.length - 1]) {
                        check_list[check_list.length - 1] = false;
                        for (int a = 0; a < check_list.length; a++) {
                          check_list[a] = false;
                        }
                      } else {
                        check_list[check_list.length - 1] = true;
                        for (int a = 0; a < check_list.length; a++) {
                          check_list[a] = true;
                        }
                      }
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        child: Image_Res(
                            !check_list[check_list.length - 1]
                                ? 'check'
                                : 'check_ch',
                            1),
                        width: 7.8.w,
                      ),
                      SizedBox(width: 2.5.w),
                      Expanded(
                        child: Text(
                          '전체 동의하기',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.3.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              height: 36.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: check_list.length,
                itemBuilder: (context, index) {
                  if (index != check_list.length - 1) {
                    return _buildAgreementItem(_titles[index], index);
                  }
                },
              ),
            ),
            SizedBox(
              height: 23.9.h,
            ),
            GestureDetector(
              onTap: () {
                if (check()) {
                  getx.Get.off(() => LoginPage2_ProfileAnnounce(),
                      transition: getx.Transition.noTransition);
                }
              },
              child: Container(
                width: double.infinity,
                height: 7.2.h,
                decoration: ShapeDecoration(
                  color: check() ? Color(0xFF78DB9B) : Color(0xFF999FA4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    '동의',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget _buildAgreementItem(String title, int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 1.62.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (check_list[index]) {
                    check_list[index] = false;
                  } else {
                    check_list[index] = true;
                  }
                });
              },
              child: SizedBox(
                child: Image_Res(!check_list[index] ? 'check' : 'check_ch', 1),
                width: 7.8.w,
              ),
            ),
            SizedBox(width: 2.5.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (check_list[index]) {
                      check_list[index] = false;
                    } else {
                      check_list[index] = true;
                    }
                  });
                },
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.3.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Image_Res('arrow_right', 1),
              width: 6.3.w,
            ),
          ],
        ),
      ),
    );
  }
}
