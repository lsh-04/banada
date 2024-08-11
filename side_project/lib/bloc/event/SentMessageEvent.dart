import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/dto/MessageSentDto.dart';

@immutable
abstract class SentMessageEvent extends Equatable {}

class SentMessageLoadEvent extends SentMessageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//메세지 보내기
class SentEvent extends SentMessageEvent {
  //DI
  final MessageSentDto sentDto;
  SentEvent({required this.sentDto});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
