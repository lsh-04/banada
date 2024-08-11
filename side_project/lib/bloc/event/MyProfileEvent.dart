import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyProfileEvent extends Equatable {}

class LoadMyProfileEvent extends MyProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
