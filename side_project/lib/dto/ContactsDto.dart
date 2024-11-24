import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:side_project/model/Nested/Snsinfos.dart';

@immutable
class ContactsDto extends Equatable {
  final String phone;
  final List<Snsinfos> snsinfos;

  ContactsDto._({required this.snsinfos, required this.phone});

  static ContactsDto of(String phone, List<Snsinfos> snsinfos) =>
      ContactsDto._(snsinfos: snsinfos, phone: phone);

  Map<String, dynamic> toJson() {
    return {"phone": this.phone, "snsinfos": this.snsinfos};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
