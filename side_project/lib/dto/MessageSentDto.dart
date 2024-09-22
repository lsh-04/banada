import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class MessageSentDto extends Equatable {
  final int sender_id;
  final int receiver_id;
  final int message_type_id;
  final String content;

  const MessageSentDto._(
      {required this.sender_id,
      required this.content,
      required this.message_type_id,
      required this.receiver_id});

  factory MessageSentDto.of(int sender_id, int receiver_id, int message_type_id,
          String content) =>
      MessageSentDto._(
          sender_id: sender_id,
          content: content,
          message_type_id: message_type_id,
          receiver_id: receiver_id);

  Map<String, dynamic> toJson() {
    return {
      "sender_id": this.sender_id,
      "receiver_id": this.receiver_id,
      "message_type_id": this.message_type_id,
      "content": this.content
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sender_id, receiver_id, message_type_id, content];
}
