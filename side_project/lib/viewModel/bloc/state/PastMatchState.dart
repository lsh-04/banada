import 'package:equatable/equatable.dart';
import 'package:side_project/repository/PastMatchRepository.dart';

abstract class PastMatchState extends Equatable {
  final PastMatchRepository? pastMatchRepository;

  const PastMatchState({this.pastMatchRepository});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitPastMatchState extends PastMatchState {
  InitPastMatchState() : super(pastMatchRepository: null);
}

class LoadedPastMatchState extends PastMatchState {
  LoadedPastMatchState({required super.pastMatchRepository});
}

class LoadingPastMatchState extends PastMatchState {
  LoadingPastMatchState() : super(pastMatchRepository: null);
}
