import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/SentMessageRepository.dart';

@immutable
abstract class SentMessageState extends Equatable {
  final SentMessageRepository? repository;
  const SentMessageState({required this.repository});

  @override
  // TODO: implement props
  List<Object?> get props => [repository];
}

class InitSentMessageState extends SentMessageState {
  InitSentMessageState() : super(repository: null);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingSentMessageState extends SentMessageState {
  LoadingSentMessageState() : super(repository: null);
}

class LoadedSentMessageState extends SentMessageState {
  LoadedSentMessageState({required super.repository});
}

class ErrorMessageState extends SentMessageState {
  ErrorMessageState() : super(repository: null);
}
