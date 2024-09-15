import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:side_project/bloc/MyProfileBloc.dart';
import 'package:side_project/bloc/event/MyProfileEvent.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/ProfileModel.dart';

@immutable
class MyProfileRepository extends Equatable {
  late ApiController apiController;
  late ProfileModel data;
  late bool phone_number;

  Future<void> getData() async {
    if (kIsWeb) {
      data = new ProfileModel.demoData();
      phone_number = false;
      return;
    }
    apiController = new ApiController<LoadMyProfileEvent>();
    try {
      final response = await apiController.apiCategorize();
      data = ProfileModel.fromJson(response.data);
      phone_number = false;
      /**
          //폰 등록 여부
          final registrationPhoneNumber = await apiController.apiCategorize();
          if (registrationPhoneNumber.statusCode != 200) {
          emit(LoadedMyProfileState(
          data: ProfileModel.fromJson(data.data), phone_number: false));
          } else {
          emit(LoadedMyProfileState(
          data: ProfileModel.fromJson(data.data), phone_number: true));
          }
          } catch (e) {
          print(e);
          emit(ErrorMyProfileState());
       */
    } catch (e) {
      print(e);
      throw Exception("오류 발생");
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, phone_number];
}
