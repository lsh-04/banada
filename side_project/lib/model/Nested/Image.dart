import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Image extends Equatable {
  final int id;
  final String? image;
  final bool is_main;
  const Image({required this.id, required this.image, required this.is_main});

  factory Image.fromJson(Map<String, dynamic> Json) =>
      Image(id: Json['id'], image: Json['image'], is_main: Json['is_main']);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
