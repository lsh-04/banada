import 'package:bloc/bloc.dart';
import './event/TimeDailyFourIntroduceEvent.dart';
import './state/TimeDailyFourIntroduceState.dart';

class TimeDailyFourIntroduceBloc
    extends Bloc<TimeDailyFourIntroduceEvent, TimeDailyFourIntroduceState> {
  //한국시간으로 조정필요함
  DateTime _dateTime = new DateTime.now();

  TimeDailyFourIntroduceBloc() : super(InitialTimeDailyFourIntroduceState()) {
    //시간 체크
    on<TimeCheckEvent>(
      (event, emit) async {
        //시간 재측정
        _dateTime = new DateTime.now();
        switch (_dateTime.hour) {
          case >= 20:
            emit(PassEightHourState());
            break;
          case >= 17:
            emit(PassFiveHourState());
            break;
          case >= 14:
            emit(PassTwoHourState());
            break;
        }
      },
    );

    //블럭 생성될때 이벤트 실행
    add(TimeCheckEvent());
  }
}
