import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class TokenDto extends Equatable {
  final int user_id; //user_id
  final int profile_id; //profile_id
  final String access; //액세스 토큰
  final String refresh; //리프레시 토큰

  const TokenDto._(
      {required this.access,
      required this.refresh,
      required this.user_id,
      required this.profile_id});

  //builder
  static TokenDto of(Map<String, dynamic> AuthJson) => TokenDto._(
      access: AuthJson["access"],
      refresh: AuthJson["refresh"],
      profile_id: AuthJson["user_id"],
      user_id: AuthJson["user_id"]);

  //Json
  Map<String, dynamic> toJson() {
    return {
      "access": this.access,
      "refresh": this.refresh,
      "user_id": this.user_id,
      "profile_id": profile_id
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
