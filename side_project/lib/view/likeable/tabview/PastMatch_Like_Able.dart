import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/bloc/PastMatchBloc.dart';
import 'package:side_project/bloc/state/PastMatchState.dart';
import 'package:side_project/reponsive_layout/Responsive_Function.dart';
import 'package:side_project/test/Image.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:get/get.dart' as getx;

class PastMatch_Like_Able extends StatelessWidget {
  const PastMatch_Like_Able({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3F4),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior()
            .copyWith(overscroll: false), // 담김 효과 제거 overscroll
        child: BlocBuilder<PastMatchBloc, PastMatchState>(
            builder: (context, state) {
          if (state is LoadedPastMatchState) {
            print(state.pastMatchRepository!.datas.length);
            return ListView(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Text(
                    '다시 마음을 표현할 수 있어요!',
                    style: TextStyle(
                      color: Color(0xFF41474C),
                      fontSize: 17.3.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (state.pastMatchRepository!.datas.length + 1) ~/ 2,
                  itemBuilder: (context, index) {
                    int firstIndex = index * 2;
                    int secondIndex = firstIndex + 1;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // context.read<OtherProfilesBloc>().add(
                              //     LoadOtherProfilesEvent(
                              //         id: state.repository!.ring_receive[firstIndex]
                              //             .contacts![0].id));
                              // Get.toNamed("DetailsProfile");
                            },
                            child: likeAbleComponent2(
                                ImageTest.image,
                                state.pastMatchRepository!.datas[firstIndex]
                                    .nickname,
                                '1000시간 전'),
                          ),
                          if (secondIndex <
                              state.pastMatchRepository!.datas.length)
                            GestureDetector(
                              onTap: () {
                                // context.read<OtherProfilesBloc>().add(
                                //     LoadOtherProfilesEvent(
                                //         id: state
                                //             .repository!
                                //             .ring_receive[secondIndex]
                                //             .contacts![0]
                                //             .id));
                                // Get.toNamed("DetailsProfile");
                              },
                              child: likeAbleComponent2(
                                  ImageTest.image,
                                  state.pastMatchRepository!.datas[secondIndex]
                                      .nickname,
                                  '1000시간 전'),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return Loading();
          }
        }),
      ),
    );
  }
}
