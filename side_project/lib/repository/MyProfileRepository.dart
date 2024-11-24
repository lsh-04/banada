import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/Nested/Contacts.dart';
import 'package:side_project/model/ProfileModel.dart';
import 'package:side_project/viewModel/bloc/event/MyProfileEvent.dart';

@immutable
class MyProfileRepository extends Equatable {
  late ApiController apiController;
  late ProfileModel data;
  final List<Contacts> contacts = new List.empty(growable: true);

  MyProfileRepository() {}

  MyProfileRepository._({required ProfileModel data}) {
    this.data = data;
  }

  //factory
  factory MyProfileRepository.of({required ProfileModel data}) =>
      MyProfileRepository._(data: data);

  Future<void> getData() async {
    apiController = new ApiController<LoadMyProfileEvent>();
    try {
      Response<dynamic> response = await apiController.apiCategorize();
      data = ProfileModel.fromJson(response.data);
      try {
        apiController = new ApiController<LoadContactsEvent>();
        response = await apiController.apiCategorize();
        log(response.toString());
        log("MyProfileRepository-> getData -> responseData: " +
            response.data.toString());
        if (response.statusCode == 200) {
          for (var a in response.data) {
            contacts.add(Contacts.fromJson(a));
          }
        }
      } catch (e) {
        log(e.toString());
        throw Exception("MyProfileRepository -> getData -> apiCategorize");
      }
    } catch (e) {
      print(e);
      throw Exception("오류 발생");
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, contacts];
}
