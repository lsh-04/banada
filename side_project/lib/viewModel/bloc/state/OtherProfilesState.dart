import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/OtherProfilesRepository.dart';

@immutable
abstract class OtherProfilesState extends Equatable {
  final OtherProfilesRepository? repository;

  const OtherProfilesState({required this.repository});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitOtherProfilesState extends OtherProfilesState {
  InitOtherProfilesState() : super(repository: null);
}

class LoadingOtherProfilesState extends OtherProfilesState {
  LoadingOtherProfilesState() : super(repository: null);
}

class LoadedOtherProfilesState extends OtherProfilesState {
  LoadedOtherProfilesState({required super.repository});
}

class ErrorOtherProfilesState extends OtherProfilesState {
  ErrorOtherProfilesState() : super(repository: null);
}
