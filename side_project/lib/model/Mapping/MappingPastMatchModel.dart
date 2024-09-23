import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/model/PastMatchModel.dart';

@immutable
class MappingPastMatchModel extends Equatable {
  late List<PastMatchModel> datas;

  MappingPastMatchModel({required this.datas});

  MappingPastMatchModel.fromJson(List<dynamic> Jsons) {
    datas = List.empty(growable: true);

    for (Map<String, dynamic> a in Jsons) {
      datas.add(PastMatchModel.fromJson(a));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}
