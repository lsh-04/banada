import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/repository/MyProfileRepository.dart';

@immutable
abstract class MyProfileEvent extends Equatable {}

class LoadMyProfileEvent extends MyProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//registerBloc에서 Registory를 만들어서 등록함
class ReigsterMyProfileEvent extends MyProfileEvent {
  MyProfileRepository myProfileRepository;
  ReigsterMyProfileEvent({required this.myProfileRepository});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
