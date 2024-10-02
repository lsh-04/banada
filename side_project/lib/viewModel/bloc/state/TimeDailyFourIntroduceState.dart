import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TimeDailyFourIntroduceState extends Equatable {
  final List<bool> passTime;

  TimeDailyFourIntroduceState({required this.passTime});

  @override
  // TODO: implement props
  List<Object?> get props => [passTime];
}

class InitialTimeDailyFourIntroduceState extends TimeDailyFourIntroduceState {
  InitialTimeDailyFourIntroduceState()
      : super(
            passTime: List.generate(4, (index) => (index < 1) ? true : false));
}

class PassTwoHourState extends TimeDailyFourIntroduceState {
  PassTwoHourState()
      : super(
            passTime: List.generate(4, (index) => (index < 2) ? true : false));
}

class PassFiveHourState extends TimeDailyFourIntroduceState {
  PassFiveHourState()
      : super(
            passTime: List.generate(4, (index) => (index < 3) ? true : false));
}

class PassEightHourState extends TimeDailyFourIntroduceState {
  PassEightHourState() : super(passTime: List.generate(4, (index) => true));
}
