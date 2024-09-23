import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/bloc/event/PastMatchEvent.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/Mapping/MappingPastMatchModel.dart';
import 'package:side_project/model/PastMatchModel.dart';

@immutable
class PastMatchRepository extends Equatable {
  late List<PastMatchModel> datas;
  late ApiController apiController;

  PastMatchRepository() : apiController = ApiController<LoadPastMatchEvent>();

  Future<void> getDatas() async {
    try {
      final response = await apiController.apiCategorize();
      datas = MappingPastMatchModel.fromJson(response.data).datas;
    } catch (e) {
      print(e);
      throw Exception("PastMatchRepository -> getDatas 오류");
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}
