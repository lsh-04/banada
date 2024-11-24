import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Snsinfos extends Equatable {
  final int id;
  final String service;
  final String username;

  const Snsinfos(
      {required this.id, required this.username, required this.service});

  factory Snsinfos.fromJson(Map<String, dynamic> Json) => Snsinfos(
      id: Json['id'], service: Json['service'], username: Json['username']);

  static Snsinfos of(String service, String username) =>
      Snsinfos(id: 0, username: username, service: service);

  Map<String, dynamic> toJson() {
    return {"service": this.service, "username": this.username};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, service, username];
}
