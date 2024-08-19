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
        print("여기");
      }
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}
