import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class TokenDto extends Equatable {
  final String access; //액세스 토큰
  final String refresh; //리프레시 토큰

  const TokenDto._({required this.access, required this.refresh});

  //builder
  static TokenDto of(Map<String, dynamic> AuthJson) =>
      TokenDto._(access: AuthJson["access"], refresh: AuthJson["refresh"]);

  //Json
  Map<String, dynamic> toJson() {
    return {"access": this.access, "refresh": this.refresh};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
