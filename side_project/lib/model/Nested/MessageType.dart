import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class MessageType extends Equatable {
  final int id;
  final String name;
  final int cost;

  const MessageType({required this.id, required this.name, required this.cost});

  factory MessageType.fromJson(Map<String, dynamic> Json) =>
      MessageType(id: Json['id'], name: Json['name'], cost: Json['cost']);
  @override
  // TODO: implement propss
  List<Object?> get props => [id, name, cost];
}
