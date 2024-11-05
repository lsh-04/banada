import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RegisterPart2Dto extends Equatable {
  final int? height;
  final String job;
  final String drinking_frequency;
  final String religion;

  const RegisterPart2Dto._(
      {required this.religion,
      required this.drinking_frequency,
      required this.height,
      required this.job});

  static RegisterPart2Dto of(
          int height, String job, String drinking_frequency, String religion) =>
      RegisterPart2Dto._(
          religion: religion,
          drinking_frequency: drinking_frequency,
          height: height,
          job: job);

  Map<String, dynamic> toJson() {
    return {
      "height": height,
      "job": job,
      "drinking_frequency": drinking_frequency,
      "religion": religion
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
