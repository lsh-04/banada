import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class ImageCubit extends Cubit<List<File>?> {
  ImageCubit() : super(null);

  void pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // 다중 선택 허용
    );

    if (result != null) {
      final _images = result.paths.map((path) => File(path!)).take(5).toList();
      emit(_images);

      //캐시 관리해야함
    }
  }
}
