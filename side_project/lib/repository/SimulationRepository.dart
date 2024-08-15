import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

@immutable
class SimulationRepository extends Equatable {
  late List<String> questiontitle;
  late List<String> questions;
  Future<void> LoadData() async {
    String data = await rootBundle.loadString('assets/txt/questiontitle.txt');
    questiontitle = data.split('\n');
    data = await rootBundle.loadString('assets/txt/questions.txt');
    questions = data.split('\n');
  }

  @override
  // TODO: implement props
  List<Object?> get props => [questiontitle, questions];
}
