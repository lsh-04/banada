import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OtherProfilesEvent extends Equatable {}

class LoadOtherProfilesEvent extends OtherProfilesEvent {
  final int id;
  LoadOtherProfilesEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
