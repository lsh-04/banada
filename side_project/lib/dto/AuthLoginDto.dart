import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class AuthLoginDto extends Equatable {
  final String username;
  final String email;
  final String password;

  const AuthLoginDto(
      {required this.email, required this.username, required this.password});

  //builder
  static AuthLoginDto build(
      {required String username,
      required String email,
      required String password}) {
    return AuthLoginDto(email: email, username: username, password: password);
  }

  //Json
  Map<String, dynamic> toJson() {
    return {"username": username, "email": email, "password": password};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
