import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/MyProfileRepository.dart';

@immutable
abstract class MyProfileState extends Equatable {
  final MyProfileRepository? repository;
  MyProfileState({required this.repository});

  @override
  // TODO: implement props
  List<Object?> get props => [repository];
}

class InitMtProfileState extends MyProfileState {
  InitMtProfileState() : super(repository: null);
}

class LoadingMyProfileState extends MyProfileState {
  LoadingMyProfileState() : super(repository: null);
}

class LoadedMyProfileState extends MyProfileState {
  LoadedMyProfileState({required super.repository});
}

class ErrorMyProfileState extends MyProfileState {
  ErrorMyProfileState() : super(repository: null);
}
