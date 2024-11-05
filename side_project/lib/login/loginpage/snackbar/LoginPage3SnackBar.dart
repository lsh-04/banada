import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/viewModel/cubit/JobCubit.dart';
import 'package:side_project/viewModel/cubit/PoliticsCubit.dart';
import 'package:side_project/viewModel/cubit/RegionCubit.dart';
import 'package:side_project/viewModel/cubit/ReligionCubit.dart';

class LoginPage3SnackBar<T> extends StatefulWidget {
  final List<String> datas;
  final String title;
  final T initialData;
  const LoginPage3SnackBar(
      {super.key,
      required this.datas,
      required this.title,
      required this.initialData});

  @override
  State<LoginPage3SnackBar> createState() => _LoginPage3SnackBarState();
}

class _LoginPage3SnackBarState extends State<LoginPage3SnackBar> {
  final List<bool> _check = List.generate(15, (index) => false);
  late final List<String> _data;

  Widget _buildRegionButton(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        if (widget.initialData is RegionCubit) {
          log(_data[index]);
          context.read<RegionCubit>().setRegion(_data[index]);
        } else if (widget.initialData == JoBCubit) {
          context.read<JoBCubit>().setJoB(_data[index]);
        } else if (widget.initialData == ReligionCubit) {
          context.read<ReligionCubit>().setReligion(_data[index]);
        } else if (widget.initialData == PoliticsCubit) {
          context.read<PoliticsCubit>().setPolitics(_data[index]);
        }
        /**
        switch (T) {
          case RegionCubit:
            try {
              context.read<RegionCubit>().setRegion(_data[index]);
              print('${context.read<RegionCubit>().state} da');
            } catch (e) {
              print(e);
            }
            break;
          case JoBCubit:
            context.read<JoBCubit>().setJoB(_data[index]);
            break;
          case ReligionCubit:
            context.read<ReligionCubit>().setReligion(_data[index]);
            break;
          case PoliticsCubit:
            context.read<PoliticsCubit>().setPolitics(_data[index]);
            break;
        }
            */
        setState(() {
          for (int a = 0; a < _check.length; a++) {
            _check[a] = false;
          }
          _check[index] = true;
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
            _data[index],
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = widget.datas;
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
                  widget.title,
                  style: TextStyle(
                    color: Color(0xFF1E2427),
                    fontSize: 17.3.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 1.0,
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 2,
                  children: List.generate(
                      _data.length, (i) => _buildRegionButton(context, i))),
            ),
          ],
        ),
      ),
    );
  }
}
