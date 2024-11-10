import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';
import 'package:side_project/model/Nested/Image.dart' as ImageModel;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/login/simulations/SimulationMain.dart' as simuls;
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/event/MyProfileEvent.dart';

class ImageCubit extends Cubit<List<dynamic>?> {
  ImageCubit() : super(null);

  void pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // 다중 선택 허용
    );

    if (result != null) {
      final List<File> _images;
      _images = result.paths.map((path) => File(path!)).take(5).toList();
      emit(_images);

      //캐시 관리해야함
    }
  }

  Future<void> sendImages(BuildContext context) async {
    List<ImageModel.Image> images = new List.empty(growable: true);

    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black54,
      context: context,
      builder: (BuildContext context) {
        return Loading();
      },
    );

    try {
      for (int a = 0; a < state!.length; a++) {
        String file = await sendImage(await state![a].readAsBytes(), a == 0);
        images.add(ImageModel.Image.fromJson(jsonDecode(file)));
      }
    } catch (e) {
      log(e.toString());
      log("ImageCubit -> sendImages -> 다량의 이미지 처리 문제");
    } finally {
      if (getx.Get.isDialogOpen ?? false) {
        getx.Get.back();
      }
      await getx.Get.offAll(() => simuls.SimulationMain(),
          transition: getx.Transition.noTransition);

      //프로필 재갱신
      context.read<MyProfileBloc>().add(LoadMyProfileEvent());
    }
  }

  Future<String> sendImage(Uint8List imageByte, bool isMain) async {
    final url = Uri.parse("https://banada.duckdns.org/api/v1/images/");

    // `http.MultipartRequest` 생성
    final request = http.MultipartRequest('POST', url);

    FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();

    final auth = await flutterSecureStorage.read(key: 'auth');

    request.headers.addAll({
      'Authorization':
          'Bearer ${jsonDecode(auth!)['access']}', // API 키를 Authorization 헤더로 설정
    });

    // 이미지 파일을 바이트로 읽기
    Uint8List imageBytes = imageByte;

    // MIME 타입 추론 (예: image/jpeg, image/png)
    final mimeType = lookupMimeType('', headerBytes: imageBytes) ??
        'application/octet-stream';
    final mimeParts = mimeType.split('/');

    // 바이트 데이터를 MultipartFile로 추가
    request.files.add(http.MultipartFile.fromBytes(
      'image',
      imageBytes,
      filename: 'image_.${mimeParts[1]}',
      contentType: DioMediaType(mimeParts[0], mimeParts[1]),
    ));

    request.fields['is_main'] = isMain.toString();

    final response = await request.send();
    // 응답을 문자열로 변환
    final responseBody = await response.stream.bytesToString();

    log(responseBody);
    return responseBody;
  }
}
