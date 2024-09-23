import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class PastMatchModel extends Equatable {
  final int id;
  final String nickname;
  final int? age;
  final int heigt;
  final bool? main_image;

  const PastMatchModel._(
      {required this.nickname,
      required this.id,
      this.main_image,
      required this.age,
      required this.heigt});

  //factory
  factory PastMatchModel.fromJson(Map<String, dynamic> Json) =>
      PastMatchModel._(
          nickname: Json['nickname'],
          id: Json['id'],
          age: Json['age'],
          heigt: Json['height'],
          main_image: Json['main_image']);
  @override
  // TODO: implement props
  List<Object?> get props => [id, age, nickname, heigt, main_image];
}
