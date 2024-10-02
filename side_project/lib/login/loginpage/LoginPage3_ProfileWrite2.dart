import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_project/login/loginpage/LoginPage4_Image.dart';
import 'package:side_project/login/loginpage/snackbar/LoginPage3SnackBar.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/viewModel/cubit/JobCubit.dart';
import 'package:side_project/viewModel/cubit/PoliticsCubit.dart';
import 'package:side_project/viewModel/cubit/ReligionCubit.dart';

class LoginPage3_ProfileWrite2 extends StatefulWidget {
  const LoginPage3_ProfileWrite2({super.key});

  @override
  State<LoginPage3_ProfileWrite2> createState() =>
      _LoginPage3_ProfileWrite2State();
}

class _LoginPage3_ProfileWrite2State extends State<LoginPage3_ProfileWrite2> {
  final TextEditingController _controller = new TextEditingController();
  int _choose1 = 0;
  int _choose2 = 0;
  final List<List<String>> _datas = new List.generate(3, (index) => []);

  bool _isPass = false;
  void check() {
    setState(() {
      if (_controller.text.isEmpty) {
        _isPass = false;
        return;
      }
      if (_choose1 == 0 || _choose2 == 0) {
        _isPass = false;
        return;
      }
      if (context.read<JoBCubit>().state.isNull ||
          context.read<ReligionCubit>().state.isNull ||
          context.read<PoliticsCubit>().state.isNull) {
        _isPass = false;
        return;
      }
      _isPass = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _datas[0] = [
      '학생',
      '사무직',
      '전문직',
      '금융직',
      '공무원',
      '대기업',
      '글로벌',
      '스타트업',
      '연구직',
      '공기업',
      '직업군인',
      '사업가',
      '프리랜서',
      '사업가',
      '기타'
    ];

    _datas[1] = ['무교', '기독교', '천주교', '불교', '기타'];
    _datas[2] = ['관심없음', '진보', '보수', '중도'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
          child: PriviousAppbar(
            text: '2/3',
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
                  height: 3.h,
                ),
                Text(
                  '나머지 정보도 알려주세요',
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
                form('키', '160', false, _controller, TextInputType.name),
                SizedBox(
                  height: 3.6.h,
                ),
                form4<JoBCubit>('직업'),
                SizedBox(
                  height: 3.6.h,
                ),
                form2('흡연 여부'),
                SizedBox(
                  height: 3.6.h,
                ),
                form3('음주 빈도'),
                SizedBox(
                  height: 3.6.h,
                ),
                form4<ReligionCubit>('종교'),
                SizedBox(
                  height: 3.6.h,
                ),
                form4<PoliticsCubit>('정치성향'),
                SizedBox(
                  height: 7.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (_isPass) {
                      getx.Get.to(() => LoginPage4_Image(),
                          transition: getx.Transition.noTransition);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.2.h,
                    decoration: ShapeDecoration(
                      color: _isPass
                          ? Color(0xFF78DB9B)
                          : Color(0xFF999FA4), //Color(0xFF999FA4)
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
                SizedBox(
                  height: 7.5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget form(title, subtitle, bool isEdit, TextEditingController controller,
      TextInputType textInputType) {
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
          onChanged: (e) {
            check();
          },
          keyboardType: textInputType,
          cursorColor: Colors.black,
          controller: controller,
          textAlign: TextAlign.start,
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
                color: Color(0xFF41474C),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFFC5C8CE),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFFC5C8CE),
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

  Widget form2(title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(
          height: 1.2.h,
        ),
        SizedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _choose1 = 1;
                    check();
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 27.2.w,
                  decoration: _choose1 == 1
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
                      '비흡연',
                      style: TextStyle(
                        color: _choose1 == 1
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
                width: 2.4.w,
              ),
              GestureDetector(
                onTap: () {
                  //check();
                  setState(() {
                    _choose1 = 2;
                    check();
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 27.2.w,
                  decoration: _choose1 == 2
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
                      '전자담배',
                      style: TextStyle(
                        color: _choose1 == 2
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
                width: 2.4.w,
              ),
              GestureDetector(
                onTap: () {
                  //check();
                  setState(() {
                    _choose1 = 3;
                    check();
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 27.2.w,
                  decoration: _choose1 == 3
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
                      '흡연',
                      style: TextStyle(
                        color: _choose1 == 3
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

  Widget form3(title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(
          height: 1.2.h,
        ),
        SizedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _choose2 = 1;
                    check();
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 27.2.w,
                  decoration: _choose2 == 1
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
                      '안 마셔요',
                      style: TextStyle(
                        color: _choose2 == 1
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
                width: 2.4.w,
              ),
              GestureDetector(
                onTap: () {
                  //check();
                  setState(() {
                    _choose2 = 2;
                    check();
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 27.2.w,
                  decoration: _choose2 == 2
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
                      '가끔 마셔요',
                      style: TextStyle(
                        color: _choose2 == 2
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
                width: 2.4.w,
              ),
              GestureDetector(
                onTap: () {
                  //check();
                  setState(() {
                    _choose2 = 3;
                    check();
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 27.2.w,
                  decoration: _choose2 == 3
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
                      '자주 마셔요',
                      style: TextStyle(
                        color: _choose2 == 3
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

  Widget form4<T>(title) {
    final int index;
    final String title;
    final String hint;
    switch (T) {
      case JoBCubit:
        index = 0;
        title = '직업 선택';
        hint = '회사원';
        break;
      case ReligionCubit:
        index = 1;
        title = '종교 선택';
        hint = '무교';
      case PoliticsCubit:
        index = 2;
        title = '정치성향 선택';
        hint = '관심없음';
      default:
        throw Exception('해킹');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                  color: Color(0xFF171B1C),
                  fontSize: 16.3.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                )),
          ],
        ),
        SizedBox(
          height: 1.2.h,
        ),
        GestureDetector(
          onTap: () async {
            await getx.Get.bottomSheet<String?>(
              LoginPage3SnackBar(
                title: title,
                datas: _datas[index],
                initialData: T,
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
                if (T == JoBCubit) ...[
                  BlocBuilder<JoBCubit, String?>(builder: (context, state) {
                    return Text(
                      state ?? hint,
                      style: TextStyle(
                        color: state.isNull ? Color(0xFF999FA4) : Colors.black,
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    );
                  }),
                ],
                if (T == ReligionCubit) ...[
                  BlocBuilder<ReligionCubit, String?>(
                      builder: (context, state) {
                    return Text(
                      state ?? hint,
                      style: TextStyle(
                        color: state.isNull ? Color(0xFF999FA4) : Colors.black,
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    );
                  }),
                ],
                if (T == PoliticsCubit) ...[
                  BlocBuilder<PoliticsCubit, String?>(
                      builder: (context, state) {
                    return Text(
                      state ?? hint,
                      style: TextStyle(
                        color: state.isNull ? Color(0xFF999FA4) : Colors.black,
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    );
                  }),
                ],
                SizedBox(
                  child: Image_Res('arrow_down', 1),
                  width: 6.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
