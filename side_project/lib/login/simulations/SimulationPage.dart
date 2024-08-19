import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/login/appbar/SimulationAppbar.dart';
import 'package:side_project/login/bloc/SimulationBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:side_project/login/cubit/SimulationChooseCubit.dart';
import 'package:side_project/login/introduce/IntroduceMain.dart';

class SimulationPage extends StatelessWidget {
  final int currentpage;
  const SimulationPage({super.key, required this.currentpage});

  List<dynamic> current() {
    if (currentpage < 4) {
      return [(currentpage / 4) + 0.25, '일상', '(${currentpage + 1}/4)'];
    } else if (currentpage < 9) {
      return [
        ((currentpage - 4) / 5) + 0.2,
        'MBTI',
        '(${(currentpage - 4) + 1}/5)'
      ];
    } else if (currentpage < 12) {
      return [
        ((currentpage - 9) / 3) + 0.34,
        '음식 취향',
        '(${(currentpage - 9) + 1}/3)'
      ];
    } else {
      return [
        ((currentpage - 12) / 3) + 0.34,
        '일과 사랑',
        '(${(currentpage - 12) + 1}/3)'
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(14.h),
          child: SimulationAppbar(
            progressValue: current()[0],
            text: current()[1],
            subtext: current()[2],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.7.w, vertical: 1.1.h),
          child: BlocBuilder<SimulationBloc, SimulationState>(
              builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 2.4.h,
                ),
                Container(
                  width: double.infinity,
                  height: 43.5.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.8.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.7.w),
                          child: Center(
                            child: Text(
                              state.simulationRepository!
                                  .questiontitle[currentpage],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xFF171B1C),
                                fontSize: 18.5.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.4.h,
                        ),
                        BlocBuilder<SimulationChooseCubit, List<int>>(
                            builder: (context, state2) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<SimulationChooseCubit>()
                                  .setChoose(currentpage, 1);
                            },
                            child: Container(
                              width: 78.w,
                              height: 11.5.h,
                              decoration: state2[currentpage] == 1
                                  ? ShapeDecoration(
                                      color: Color(0xFFEBF8F2),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFF02D289)),
                                        borderRadius: BorderRadius.circular(20),
                                      ))
                                  : BoxDecoration(
                                      color: Color(0xFFF1F2F4),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.8.w),
                                child: Center(
                                  child: Text(
                                    state.simulationRepository!
                                        .questions[currentpage * 2],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF171B1C),
                                      fontSize: 17.3.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: state2[currentpage] == 1
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 2.3.h,
                        ),
                        BlocBuilder<SimulationChooseCubit, List<int>>(
                            builder: (context, state2) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<SimulationChooseCubit>()
                                  .setChoose(currentpage, 2);
                            },
                            child: Container(
                              width: 78.w,
                              height: 11.5.h,
                              decoration: state2[currentpage] == 2
                                  ? ShapeDecoration(
                                      color: Color(0xFFEBF8F2),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFF02D289)),
                                        borderRadius: BorderRadius.circular(20),
                                      ))
                                  : BoxDecoration(
                                      color: Color(0xFFF1F2F4),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.8.w),
                                child: Center(
                                  child: Text(
                                    state.simulationRepository!
                                        .questions[currentpage * 2 + 1],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF171B1C),
                                      fontSize: 17.3.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: state2[currentpage] == 2
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.5.h,
                ),
                BlocBuilder<SimulationChooseCubit, List<int>>(
                    builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (state[currentpage] != 0) {
                        if (currentpage < 14) {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                      secondaryAnimation) =>
                                  SimulationPage(currentpage: currentpage + 1),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        } else {
                          getx.Get.to(() => IntroduceMain(),
                              transition: getx.Transition.noTransition);
                        }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.1.w),
                      child: Container(
                        width: double.infinity,
                        height: 7.2.h,
                        decoration: ShapeDecoration(
                          color: state[currentpage] != 0
                              ? Color(0xFF78DB9B)
                              : Color(0xFF999FA4),
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
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
