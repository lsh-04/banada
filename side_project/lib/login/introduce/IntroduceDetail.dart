import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:side_project/login/cubit/IntroduceCubit.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;

class IntroduceDetail extends StatefulWidget {
  final int index;
  final String text;
  const IntroduceDetail({super.key, required this.index, required this.text});

  @override
  State<IntroduceDetail> createState() => _IntroduceDetailState();
}

class _IntroduceDetailState extends State<IntroduceDetail> {
  TextEditingController _controller = new TextEditingController();
  bool _ischange = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TextEditingController(
        text: context.read<IntroduceCubit>().state[widget.index - 1]);

    if (_controller.text.length >= 40) {
      _ischange = true;
    }
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
          child: PriviousAppbar(),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w),
            child: Column(
              children: [
                SizedBox(
                  height: 0.8.h,
                ),
                Hero(
                  tag: 'unique-tag-${widget.index}',
                  child: Container(
                    width: 66.w,
                    child: Text(
                      softWrap: true,
                      widget.text,
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
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '(최소 40자, 최대 500자로 적어주세요)',
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
                  height: 2.5.h,
                ),
                Container(
                  height: 42.9.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 1.5.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F2F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (e) {
                      setState(() {
                        if (_controller.text.length >= 40) {
                          _ischange = true;
                        } else {
                          _ischange = false;
                        }
                      });
                    },
                    controller: _controller,
                    textAlign: TextAlign.start,
                    maxLength: 500,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Color(0xFF999FA4),
                        fontSize: 15.2.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: '답변을 적어주세요. 자세하게 적을수록 매칭률이 높아져요.',
                      hintMaxLines: 2,
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(top: 1.4.h, left: 4.w, right: 4.w),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.2.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.1.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.length >= 40) {
                      getx.Get.back();
                      context
                          .read<IntroduceCubit>()
                          .setText(widget.index - 1, _controller.text);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.2.h,
                    decoration: ShapeDecoration(
                      color: _ischange ? Color(0xFF78DB9B) : Color(0xFF999FA4),
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
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
