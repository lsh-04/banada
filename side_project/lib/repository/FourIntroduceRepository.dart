import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/FourIntroduceModel.dart';
import 'package:side_project/viewModel/bloc/DailyFourIntroduceBloc.dart';
import '../model/Mapping/MappingFourIntroduceModel.dart';

@immutable
class FourIntroduceRepository extends Equatable {
  late ApiController apiController;
  late List<FourIntroduceModel> datas;

  Future<void> getData() async {
    if (kIsWeb) {
      datas = MappingFourIntroduceModel.dummyData().datas;
      return;
    }

    apiController = new ApiController<DailyFourIntroduceBloc>();
    try {
      final response = await apiController.apiCategorize();
      datas = MappingFourIntroduceModel.fromJson(response.data).datas;
    } catch (e) {
      print(e);
      throw Exception("오류 발생");
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}
