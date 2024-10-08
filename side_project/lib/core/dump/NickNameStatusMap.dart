import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/viewModel/bloc/NickNameValidBloc.dart';

@immutable
class NickNameStatusMap {
  static final Map<NickNameValidState, Widget> nickNameStatusMap = {};

  NickNameStatusMap() {
    nickNameStatusMap.addAll({
      //가능
      PossibleNickNameValidState(): _possibleNicknameValidWidget(),
      //로딩
      InitNickNameValidState(): _loadingNicknameValidWidget(),
      LoadingNickNameValidState(): _loadingNicknameValidWidget(),
      //중복
      DuplicationNickNameValidState(): _duplicationNickNameValidWidget()
    });
  }

  Widget _possibleNicknameValidWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 13.2.w,
        height: 3.h,
        decoration: ShapeDecoration(
          color: Color(0xFF78DB9B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            '가능',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.3.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingNicknameValidWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 13.2.w,
        height: 3.h,
        decoration: ShapeDecoration(
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            '로딩',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.3.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _duplicationNickNameValidWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 13.2.w,
        height: 3.h,
        decoration: ShapeDecoration(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            '중복',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.3.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
