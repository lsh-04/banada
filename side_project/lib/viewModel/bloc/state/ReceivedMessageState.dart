import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/ReceivedMessageRepository.dart';

@immutable
abstract class ReceivedMessageState extends Equatable {
  final ReceivedMessageRepository? repository;
  const ReceivedMessageState({required this.repository});

  //getter + private
  @override
  List<Object?> get props => [repository];
}

class InitMessageState extends ReceivedMessageState {
  //init
  InitMessageState() : super(repository: null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingReceivedMessageState extends ReceivedMessageState {
  LoadingReceivedMessageState() : super(repository: null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedReceivedMessageState extends ReceivedMessageState {
  const LoadedReceivedMessageState({required super.repository});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorMessageState extends ReceivedMessageState {
  ErrorMessageState() : super(repository: null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
