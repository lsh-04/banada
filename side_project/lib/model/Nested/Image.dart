import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Image extends Equatable {
  final int id;
  final String image;
  const Image({required this.id, required this.image});

  factory Image.fromJson(Map<String, dynamic> Json) =>
      Image(id: Json['id'], image: Json['image']);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
