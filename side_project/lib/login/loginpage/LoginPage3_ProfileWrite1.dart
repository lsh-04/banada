import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:side_project/core/dump/NickNameStatusMap.dart';
import 'package:side_project/login/loginpage/LoginPage3_ProfileWrite2.dart';
import 'package:side_project/login/loginpage/snackbar/LoginPage3SnackBar.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/repository/MyProfileRepository.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/NickNameValidBloc.dart';
import 'package:side_project/viewModel/cubit/RegionCubit.dart';

class LoginPage3_ProfileWrite1 extends StatefulWidget {
  const LoginPage3_ProfileWrite1({super.key});

  @override
  State<LoginPage3_ProfileWrite1> createState() =>
      _LoginPage3_ProfileWrite1State();
}

class _LoginPage3_ProfileWrite1State extends State<LoginPage3_ProfileWrite1> {
  final List<TextEditingController> _controller =
      List.generate(2, (index) => new TextEditingController());
  bool _nicknameValid = true;
  int _choose = 0;
  bool _isPass = false;
  bool _dayValid = true;
  Timer? timer;
  final List<String> _data = [
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

  bool dayValid() {
    // 정규식을 사용하여 '0000.00.00' 형식인지 확인
    final RegExp dateRegExp = RegExp(r'^\d{4}\.\d{2}\.\d{2}$');
    return dateRegExp.hasMatch(_controller[1].text);
  }

  void check() {
    setState(() {
      //유효성 검사 1: 닉네임
      if (!(context.read<NickNameValidBloc>().state
          is PossibleNickNameValidState)) {
        _isPass = false;
        return;
      }
      //유효성 검사 2: 생년월일
      if (!dayValid()) {
        _isPass = false;
        return;
      }
      //유효성 검사 3: 성별
      if (_choose == 0) {
        _isPass = false;
        return;
      }
      //유효성 검사 4: 지역
      if (context.read<RegionCubit>().state.isNull) {
        _isPass = false;
        return;
      }
      _isPass = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    final MyProfileRepository? myProfileRepository =
        context.read<MyProfileBloc>().state.repository;
    //이전 상태 불러오기
    if (myProfileRepository != null) {
      if (myProfileRepository.data.nickname != null) {
        _controller[0].text =
            context.read<MyProfileBloc>().state.repository!.data.nickname!;
      }
      if (myProfileRepository.data.residence!.isNotEmpty) {
        context
            .read<RegionCubit>()
            .setRegion(myProfileRepository.data.residence);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
            child: PriviousAppbar(
              text: '1/3',
              fontsize: 18.sp,
            ),
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
                    '기본 프로필을 작성해주세요',
                    style: TextStyle(
                      color: Color(0xFF171B1C),
                      fontSize: 19.5.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(
                    height: 5.25.h,
                  ),
                  //i/o
                  form('닉네임', '최소 2글자 ~ 최대 7글자(한/영 가능)', false,
                      TextInputType.name),
                  SizedBox(
                    height: 3.6.h,
                  ),
                  form2('성별', true),
                  SizedBox(
                    height: 3.6.h,
                  ),
                  form_type_2('생년월일', '1990.01.01', true, _controller[1],
                      TextInputType.datetime),
                  SizedBox(
                    height: 3.6.h,
                  ),
                  form3('거주지', true),
                  //버튼
                  GestureDetector(
                    onTap: () {
                      if (_isPass) {
                        getx.Get.to(() => LoginPage3_ProfileWrite2(),
                            transition: getx.Transition.noTransition);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 7.2.h,
                      decoration: ShapeDecoration(
                        color: _isPass ? Color(0xFF78DB9B) : Color(0xFF999FA4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '다음',
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget form(title, subtitle, bool isEdit, TextInputType textInputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isEdit ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 16.3.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            if (isEdit) ...[
              Text(
                '추후 수정불가',
                style: TextStyle(
                  color: Color(0xFF999FA4),
                  fontSize: 16.3.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              )
            ],
          ],
        ),
        SizedBox(
          height: 1.2.h,
        ),
        Container(
          height: 6.8.h,
          child: Stack(
            children: [
              if (_controller[0].text.length >= 1) ...[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                    child: BlocConsumer<NickNameValidBloc, NickNameValidState>(
                      listener: (context, state) {
                        if (state is DuplicationNickNameValidState) {
                          setState(() {
                            _nicknameValid = false;
                          });
                        }
                      },
                      builder: (context, state) {
                        NickNameStatusMap nickNameStatusMap =
                            NickNameStatusMap();
                        log(state.toString());
                        return nickNameStatusMap.getNickNameStatusMap()[state]!;
                      },
                    )),
              ],
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7), // 최대 7글자까지 입력 가능
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]')), // 숫자를 제한
                ],
                keyboardType: textInputType,
                cursorColor: Colors.black,
                controller: _controller[0],
                textAlign: TextAlign.start,
                onChanged: (e) {
                  //닉네임 유효성 초기화
                  context
                      .read<NickNameValidBloc>()
                      .add(InitNickNameValidEvent());

                  if (timer != null) {
                    timer!.cancel();
                  }

                  if (_controller[0].text.length >= 2 &&
                      _controller[0].text.length <= 7) {
                    _nicknameValid = true;

                    timer = Timer(
                      Duration(milliseconds: 1500),
                      () {
                        context.read<NickNameValidBloc>().add(
                            NickNameValidEvent(nickname: _controller[0].text));
                        log(_controller[0].text);
                      },
                    );
                  } else {
                    _nicknameValid = false;
                  }
                  check();
                },
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 17.3.sp,
                    color: Colors.black,
                    height: 1),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.3.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _nicknameValid ? Color(0xFF41474C) : Colors.red,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _nicknameValid ? Color(0xFFC5C8CE) : Colors.red,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _nicknameValid ? Color(0xFFC5C8CE) : Colors.red,
                      width: 1,
                    ),
                  ),
                  hintText: subtitle,
                  fillColor: Color(0xFFFDFDFD),
                  hintStyle: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 17.3.sp,
                    color: Color(0xFF999FA4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget form_type_2(title, subtitle, bool isEdit,
      TextEditingController controller, TextInputType textInputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isEdit ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 16.3.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            if (isEdit) ...[
              Text(
                '추후 수정불가',
                style: TextStyle(
                  color: Color(0xFF999FA4),
                  fontSize: 16.3.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              )
            ],
          ],
        ),
        SizedBox(
          height: 1.2.h,
        ),
        TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(10), // 최대 10글자까지 입력 가능
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')), // 숫자와 '.'만 허용
          ],
          keyboardType: textInputType,
          cursorColor: Colors.black,
          controller: controller,
          textAlign: TextAlign.start,
          onChanged: (e) {
            if (controller.text.length != 10) {
              setState(() {
                _dayValid = false;
              });
            } else {
              setState(() {
                _dayValid = dayValid();
              });
            }
            check();
          },
          style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 17.3.sp,
              color: Colors.black,
              height: 1),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.3.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _dayValid ? Color(0xFF41474C) : Colors.red,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _dayValid ? Color(0xFFC5C8CE) : Colors.red,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _dayValid ? Color(0xFFC5C8CE) : Colors.red,
                width: 1,
              ),
            ),
            hintText: subtitle,
            fillColor: Color(0xFFFDFDFD),
            hintStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 17.3.sp,
              color: Color(0xFF999FA4),
            ),
          ),
        ),
      ],
    );
  }

  Widget form2(title, bool isEdit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isEdit ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 16.3.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            if (isEdit) ...[
              Text(
                '추후 수정불가',
                style: TextStyle(
                  color: Color(0xFF999FA4),
                  fontSize: 16.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              )
            ],
          ],
        ),
        SizedBox(
          height: 1.2.h,
        ),
        SizedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _choose = 1;
                  });
                  check();
                },
                child: Container(
                  height: 6.5.h,
                  width: 41.5.w,
                  decoration: _choose == 1
                      ? ShapeDecoration(
                          color: Color(0xFFEBF8F2),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF02D289)),
                            borderRadius: BorderRadius.circular(10),
                          ))
                      : BoxDecoration(
                          color: Color(0xFFE9EBEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                  child: Center(
                    child: Text(
                      '남성',
                      style: TextStyle(
                        color: _choose == 1
                            ? Color(0xFF02D289)
                            : Color(0xFF5A6166),
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3.4.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _choose = 2;
                  });
                  check();
                },
                child: Container(
                  height: 6.5.h,
                  width: 41.5.w,
                  decoration: _choose == 2
                      ? ShapeDecoration(
                          color: Color(0xFFEBF8F2),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF02D289)),
                            borderRadius: BorderRadius.circular(10),
                          ))
                      : BoxDecoration(
                          color: Color(0xFFE9EBEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                  child: Center(
                    child: Text(
                      '여성',
                      style: TextStyle(
                        color: _choose == 2
                            ? Color(0xFF02D289)
                            : Color(0xFF5A6166),
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget form3(title, bool isEdit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isEdit ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: 16.3.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            if (isEdit) ...[
              Text(
                '추후 수정불가',
                style: TextStyle(
                  color: Color(0xFF999FA4),
                  fontSize: 16.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              )
            ],
          ],
        ),
        SizedBox(
          height: 1.2.h,
        ),
        GestureDetector(
          onTap: () async {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FocusScope.of(context).unfocus();
            });
            await getx.Get.bottomSheet<String?>(
              LoginPage3SnackBar<RegionCubit>(
                title: '거주지 선택',
                datas: _data,
                initialData: context.read<RegionCubit>(),
              ),
            );
            check();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.8.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Color(0xFFC5C8CE),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<RegionCubit, String?>(builder: (context, state) {
                  return Text(
                    state ?? '서울',
                    style: TextStyle(
                      color: !state.isNull ? Colors.black : Color(0xFF999FA4),
                      fontSize: 17.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  );
                }),
                SizedBox(
                  child: Image_Res('arrow_down', 1),
                  width: 6.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 14.9.h,
        ),
      ],
    );
  }
}
