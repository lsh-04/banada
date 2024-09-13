import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class LoginModel extends Equatable {
  final String platform;
  final String accessToken;
  final String refreshToken;

  const LoginModel(
      {required this.refreshToken,
      required this.accessToken,
      required this.platform});

  //Json
  Map<String, dynamic> toJson() {
    return {
      "platform": platform,
      "accessToken": accessToken,
      "refreshToken": refreshToken
    };
  }

  //factory
  factory LoginModel.fromJson(Map<String, dynamic> Json) => LoginModel(
      refreshToken: Json["refreshToken"] as String,
      accessToken: Json["accessToken"] as String,
      platform: Json["platform"] as String);

  //builder
  static LoginModel build(
          {required String platform,
          required String accessToken,
          required String refreshToken}) =>
      LoginModel(
          refreshToken: refreshToken,
          accessToken: accessToken,
          platform: platform);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
