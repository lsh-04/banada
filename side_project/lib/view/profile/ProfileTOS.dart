import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/view/etc/Preparing.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/view/profile/ProfileDetailsTOS.dart';

class ProfileTOS extends StatelessWidget {
  const ProfileTOS({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      '서비스 이용약관 동의',
      '개인정보 수집 및 이용 동의',
      '위치정보 이용약관 동의',
      '마케팅 수신 동의(선택)'
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
            child: PriviousAppbar(
              text: '이용약관',
              fontsize: 18.sp,
              color: Color(0xffF2F3F4),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                height: 32.5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      list.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            getx.Get.to(ProfileDetailsTOS(name: list[index]),
                                transition: getx.Transition.noTransition);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 5.1.w),
                                height: 5.7.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      list[index],
                                      style: TextStyle(
                                        color: Color(0xFF1E2427),
                                        fontSize: 17.3.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 23.sp,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              if (index != list.length - 1)
                                Divider(thickness: 0.5),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
