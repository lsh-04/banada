import 'package:flutter/material.dart';
import 'package:side_project/core/reponsive_layout/Responsive_Function.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/model/AnswersModel.dart';
import 'package:side_project/view/etc/Preparing.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimulationResult extends StatelessWidget {
  final Map<String, List<dynamic>> map = new Map();
  List<String> nameList = ["일상", "MBTI", "음식 취향", "일과 사랑"];
  SimulationResult({super.key});

  Widget simulationComponent(BuildContext context, String key) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                key,
                style: TextStyle(
                  color: Color(0xFF1E2427),
                  fontSize: 17.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            // Replace ListView.builder with Column
            Column(
              children: List.generate(
                map[key]!.length,
                (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showPrepareDialog(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  map[key]![index].question,
                                  style: TextStyle(
                                    color: Color(0xFF1E2427),
                                    fontSize: 17.3.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  map[key]![index].answer,
                                  style: TextStyle(
                                    color: Color(0xFF00C57D),
                                    fontSize: 16.3.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (index != map[key]!.length - 1)
                        Divider(thickness: 0.5),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> list =
        context.read<MyProfileBloc>().state.repository!.data.answers;
    for (String k in nameList) {
      map[k] = List.empty(growable: true);

      switch (k) {
        case "일상":
          for (int a = 0; a < 6; a++) {
            map[k]!.add(list[a]);
          }
          break;
        case "MBTI":
          for (int a = 6; a < 10; a++) {
            map[k]!.add(list[a]);
          }
          break;
        case "음식 취향":
          for (int a = 10; a < 13; a++) {
            map[k]!.add(list[a]);
          }
          break;
        case "일과 사랑":
          for (int a = 13; a < 16; a++) {
            map[k]!.add(list[a]);
          }
          break;
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F3F4),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.8.w, vertical: 1.1.h),
              child: PriviousAppbar(
                  text: '연애 시뮬레이션 결과', fontsize: 18.sp, hideBack: false),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    color: Color(0xFF02D289),
                    child: Center(
                      child: Text(
                        "원하는 답변을 누르면 수정할 수 있어요!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.3.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.1.w),
                    child: Column(
                      children: [
                        simulationComponent(context, nameList[index]),
                        SizedBox(height: 2.5.h),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.1.w),
                child: Column(
                  children: [
                    simulationComponent(context, nameList[index]),
                    SizedBox(height: 2.5.h),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
