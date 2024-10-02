import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/dto/MessageUpdateDto.dart';

@immutable
//event
abstract class ReceivedMessageEvent extends Equatable {}

//받은 메세지 처리
class ReceivedMessageLoadEvent extends ReceivedMessageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//받은 메세지 거절
class ReceivedMessagedRefuseEvent extends ReceivedMessageEvent {
  final MessageUpdateDto messageUpdateDto;

  ReceivedMessagedRefuseEvent(this.messageUpdateDto);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
