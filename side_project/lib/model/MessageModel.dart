import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import './nested/MessageType.dart';
import './Nested/Contacts.dart';

@immutable
class MessageModel extends Equatable {
  final int? id;
  final String? sender_name;
  final String? receiver_name;
  final List<dynamic>? contacts;
  final String? content;
  final String? status;
  final MessageType? message_type;

  const MessageModel(
      {this.id,
      this.sender_name,
      this.receiver_name,
      this.contacts,
      this.message_type,
      this.content,
      this.status});

  factory MessageModel.fromJson(Map<String, dynamic> Json) => MessageModel(
      id: Json["id"],
      sender_name: Json["sender_name"],
      receiver_name: Json["receiver_name"],
      contacts: Json["contacts"].map((e) => Contacts.fromJson(e)).toList(),
      message_type: MessageType.fromJson(Json["message_type"]),
      status: Json["status"],
      content: Json["content"]);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        sender_name,
        receiver_name,
        receiver_name,
        contacts,
        status,
        message_type
      ];
}
