import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/ProfileModel.dart';

@immutable
class OtherProfilesRepository extends Equatable {
  late final ApiController apiController;
  late ProfileModel data;
  final int id;

  OtherProfilesRepository({required this.id});

  Future<void> getData() async {
    apiController = new ApiController<LoadOtherProfilesEvent>(id: this.id);
    try {
      final response = await apiController.apiCategorize();
      data = ProfileModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception("오류 발생");
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
