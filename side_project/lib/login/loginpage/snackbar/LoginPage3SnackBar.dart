import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/login/cubit/RegionCubit.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage3SnackBar extends StatefulWidget {
  const LoginPage3SnackBar({super.key});

  @override
  State<LoginPage3SnackBar> createState() => _LoginPage3SnackBarState();
}

class _LoginPage3SnackBarState extends State<LoginPage3SnackBar> {
  final List<bool> _check = List.generate(15, (index) => false);
  final List<String> _region = [
    '서울',
    '경기',
    '인천',
    '강원',
    '대전',
    '세종',
    '부산',
    '대구',
    '광주',
    '충남',
    '충북',
    '전남',
    '전북',
    '경북',
    '제주'
  ];

  Widget _buildRegionButton(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int a = 0; a < _check.length; a++) {
            _check[a] = false;
          }
          _check[index] = true;
          context.read<RegionCubit>().setRegion(_region[index]);
        });
      },
      child: Container(
        decoration: _check[index]
            ? ShapeDecoration(
                color: Color(0xFFEBF8F2),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF02D289)),
                  borderRadius: BorderRadius.circular(10),
                ))
            : BoxDecoration(
                color: Color(0xFFE9EBEE),
                borderRadius: BorderRadius.circular(10),
              ),
        child: Center(
          child: Text(
            _region[index],
            style: TextStyle(
              color: _check[index] ? Color(0xFF02D289) : Color(0xFF5A6166),
              fontSize: 17.3.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '거주지 선택',
                  style: TextStyle(
                    color: Color(0xFF1E2427),
                    fontSize: 17.3.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                //돌아가기 버튼
                GestureDetector(
                  onTap: () => getx.Get.back(),
                  child: Container(
                    width: 6.w,
                    child: Image_Res('delete_black', 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.3.h,
            ),
            Container(
              height: 41.9.h,
              child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 2,
                  children: List.generate(
                      _region.length, (i) => _buildRegionButton(context, i))),
            ),
          ],
        ),
      ),
    );
  }
}
