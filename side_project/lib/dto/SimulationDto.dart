import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class SimulationDto extends Equatable {
  final int simulation_id;
  final int answer_choice_id;

  const SimulationDto._(
      {required this.answer_choice_id, required this.simulation_id});

  factory SimulationDto.of(int simulation_id, int answer_choice_id) =>
      SimulationDto._(
          answer_choice_id: answer_choice_id, simulation_id: simulation_id);

  Map<String, dynamic> toJson() {
    return {
      "simulation_id": this.simulation_id,
      "answer_choice_id": this.answer_choice_id
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
