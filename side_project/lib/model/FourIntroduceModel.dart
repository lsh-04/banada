import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class FourIntroduceModel extends Equatable {
  final int id;
  final String? nickname;
  final int? age;
  final int height;
  final String? main_image;

  const FourIntroduceModel(
      {required this.id,
      this.nickname,
      required this.age,
      required this.height,
      this.main_image});

  //factory
  factory FourIntroduceModel.fromJson(Map<String, dynamic> Json) =>
      FourIntroduceModel(
        //include null
        main_image: Json["main_image"],
        nickname: Json["nickname"],

        //immutability
        id: Json["id"],
        age: Json["age"],
        height: Json["height"],
      );

  //private getter
  @override
  // TODO: implement props
  List<Object?> get props => [id, nickname, age, height, main_image];
}
