import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class MessageUpdateDto extends Equatable {
  final String content;
  final String status;
  final int id;

  const MessageUpdateDto._(
      {required this.id, required this.status, required this.content});

  //factory
  static MessageUpdateDto of(int id, String status, String content) =>
      MessageUpdateDto._(id: id, status: status, content: content);

  @override
  // TODO: implement props
  List<Object?> get props => [content, status, id];
}
