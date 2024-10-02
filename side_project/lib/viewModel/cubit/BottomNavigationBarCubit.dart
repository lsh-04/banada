import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/viewModel/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/viewModel/bloc/event/TimeDailyFourIntroduceEvent.dart';

class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit() : super(0);

  //페이지 변경
  void setPage(BuildContext context, int index) {
    if (index == 0) {
      context.read<TimeDailyFourIntroduceBloc>().add(TimeCheckEvent());
    }
    emit(index);
  }
}
