import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_project/viewModel/bloc/OtherProfilesBloc.dart';

class DesignComponent_Answers extends StatefulWidget {
  const DesignComponent_Answers({super.key});

  @override
  State<DesignComponent_Answers> createState() =>
      _DesignComponent_AnswersState();
}

class _DesignComponent_AnswersState extends State<DesignComponent_Answers> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherProfilesBloc, OtherProfilesState>(
        builder: (context, state) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.repository!.data.answers.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 28.5.h,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.7.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.repository!.data.answers[index].question,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF171B1C),
                        fontSize: 16.8.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 0.8.h,
                    ),
                    Text(
                      state.repository!.data.answers[index].answer,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF5A6166),
                        fontSize: 15.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
            ],
          );
        },
      );
    });
  }
}
