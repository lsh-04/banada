import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AuthorizedDto extends Equatable {
  final String username;
  final String password;

  const AuthorizedDto({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": this.username, "password": this.password};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}
