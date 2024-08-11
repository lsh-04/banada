import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import './Snsinfos.dart';

@immutable
class Contacts extends Equatable {
  final int id;
  final String phone_number;
  final List<dynamic> snsinfos;

  const Contacts(
      {required this.id, required this.phone_number, required this.snsinfos});

  factory Contacts.fromJson(Map<String, dynamic> Json) => Contacts(
      id: Json['id'],
      phone_number: Json['phone_number'],
      snsinfos: Json['snsinfos'].map((e) => Snsinfos.fromJson(e)).toList());
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
