import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:side_project/view/loading/Loading.dart';
import 'package:get/get.dart' as getx;

class ProfileDetailsTOS extends StatelessWidget {
  final String name;
  const ProfileDetailsTOS({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Map<String, String> tos = {
      '서비스 이용약관 동의': 'assets/tos/service.md',
      '개인정보 수집 및 이용 동의': 'assets/tos/personal.md',
      '위치정보 이용약관 동의': 'assets/tos/location.md',
      '마케팅 수신 동의(선택)': 'assets/tos/marketing.md'
    };
    // Stream으로 파일 로드
    Stream<String> loadMarkdownContent() async* {
      try {
        // 파일 로드
        yield await rootBundle.loadString(tos[this.name]!);
      } catch (e) {
        print(e.toString());
        print("TOS Widget -> loadMarkdownContent()");
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
            child: PriviousAppbar(text: name, fontsize: 18.sp, hideBack: false),
          ),
        ),
        backgroundColor: Colors.white, //Color(0xFFF7F8F9),
        body: Container(
          color: Color(0xFFF7F8F9),
          padding: EdgeInsets.symmetric(horizontal: 6.8.w),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                height: 78.h,
                child: StreamBuilder<String>(
                  stream: loadMarkdownContent(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // 데이터 렌더링
                      return Markdown(
                          extensionSet: md.ExtensionSet(
                            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                            md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                          ),
                          data: snapshot.data!,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(
                              color: Color(0xFF41474C),
                              fontSize: 18.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ), // 일반 텍스트 스타일
                            h1: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                            h2: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ));
                    } else {
                      // 기본 상태 (예: 데이터가 없을 때)
                      return Loading();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  getx.Get.back();
                },
                child: Container(
                  width: double.infinity,
                  height: 7.2.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF78DB9B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '돌아가기',
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
    );
  }
}
