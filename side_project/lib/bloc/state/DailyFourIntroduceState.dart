import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/FourIntroduceRepository.dart';

@immutable
abstract class DailyFourIntroduceState extends Equatable {
  //상태관리 대상
  final FourIntroduceRepository? repository;

  DailyFourIntroduceState({required this.repository});

  //private + getter
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialDailyFourIntroduceState extends DailyFourIntroduceState {
  InitialDailyFourIntroduceState() : super(repository: null);

  //private + getter
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingDailyFourIntroduceState extends DailyFourIntroduceState {
  LoadingDailyFourIntroduceState() : super(repository: null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedDailyFourIntroduceState extends DailyFourIntroduceState {
  LoadedDailyFourIntroduceState({required super.repository});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorDailyFourIntroduceState extends DailyFourIntroduceState {
  ErrorDailyFourIntroduceState() : super(repository: null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
