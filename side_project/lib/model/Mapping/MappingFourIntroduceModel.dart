import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../FourIntroduceModel.dart';

@immutable
class MappingFourIntroduceModel extends Equatable {
  late List<FourIntroduceModel> datas;

  MappingFourIntroduceModel.fromJson(List<dynamic> Json) {
    //initialize
    datas = List<FourIntroduceModel>.empty(growable: true);

    for (int a = 0; a < Json.length; a++) {
      try {
        datas.add(FourIntroduceModel.fromJson(Json[a]));
      } catch (e) {
        print(e);
        print("MappingFourIntroduceModel -> fromJson Error");
      }
    }
  }

  MappingFourIntroduceModel.dummyData() {
    datas = List<FourIntroduceModel>.empty(growable: true);

    for (int a = 0; a < 10; a++) {
      try {
        datas.add(FourIntroduceModel.fromJson(
            {'id': 1, 'nickname': 'test', 'age': 100, 'height': 100}));
      } catch (e) {
        print(e);
        print("여기");
      }
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}
