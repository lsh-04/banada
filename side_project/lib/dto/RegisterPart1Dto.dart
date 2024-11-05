import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegisterPart1Dto extends Equatable {
  final String region;
  final String nickname;

  const RegisterPart1Dto._({required this.region, required this.nickname});

  static RegisterPart1Dto of(
          {required String religion, required String nickName}) =>
      RegisterPart1Dto._(region: religion, nickname: nickName);

  Map<String, dynamic> toJson() {
    return {"residence": this.region, "nickname": this.nickname};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [region, nickname];
}
