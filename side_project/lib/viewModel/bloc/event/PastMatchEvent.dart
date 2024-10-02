import 'package:equatable/equatable.dart';

abstract class PastMatchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadPastMatchEvent extends PastMatchEvent {}
