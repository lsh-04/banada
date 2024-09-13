import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class AuthUserDto extends Equatable {
  final String username;
  final String email;
  final String password1;
  final String password2;

  const AuthUserDto(
      {required this.email,
      required this.username,
      required this.password1,
      required this.password2});

  //builder
  static AuthUserDto build(
      {required String username,
      required String email,
      required String password1,
      required String password2}) {
    return AuthUserDto(
        email: email,
        username: username,
        password1: password1,
        password2: password2);
  }

  //Json
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
