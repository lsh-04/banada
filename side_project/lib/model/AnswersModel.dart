import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AnswersModel extends Equatable {
  final int id;
  final String question;
  final String answer;

  const AnswersModel(
      {required this.id, required this.answer, required this.question});

  factory AnswersModel.fromJson(Map<String, dynamic> Json) => AnswersModel(
      id: Json['id'], answer: Json['answer'], question: Json['question']);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
