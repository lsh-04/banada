import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                  height: 2.4.h,
                ),
                Text(
                  '나머지 정보도 알려주세요',
                  style: TextStyle(
                    color: Color(0xFF171B1C),
                    fontSize: 19.5.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w800,
                    height: 0,
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
                form2('흡연 여부'),
                SizedBox(
                  height: 3.6.h,
                ),
                form3('음주 빈도'),
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
                height: 0,
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
                  height: 0,
                ),
              )
            ],
          ],
        ),
        SizedBox(
          height: 1.2.h,
        ),
        TextField(
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
            height: 0,
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
                    //check();
                    _choose1 = 1;
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 41.5.w,
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
                      '남성',
                      style: TextStyle(
                        color: _choose1 == 1
                            ? Color(0xFF02D289)
                            : Color(0xFF5A6166),
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
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
                  //check();
                  setState(() {
                    //check();
                    _choose1 = 2;
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 41.5.w,
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
                      '여성',
                      style: TextStyle(
                        color: _choose1 == 2
                            ? Color(0xFF02D289)
                            : Color(0xFF5A6166),
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
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
            height: 0,
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
                    //check();
                    _choose2 = 1;
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 41.5.w,
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
                      '남성',
                      style: TextStyle(
                        color: _choose2 == 1
                            ? Color(0xFF02D289)
                            : Color(0xFF5A6166),
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
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
                  //check();
                  setState(() {
                    //check();
                    _choose2 = 2;
                  });
                },
                child: Container(
                  height: 6.5.h,
                  width: 41.5.w,
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
                      '여성',
                      style: TextStyle(
                        color: _choose2 == 2
                            ? Color(0xFF02D289)
                            : Color(0xFF5A6166),
                        fontSize: 17.3.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
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
}
