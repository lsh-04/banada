import 'package:flutter_bloc/flutter_bloc.dart';

class ReligionCubit extends Cubit<String?> {
  ReligionCubit() : super(null);

  void setReligion(String? religion) {
    emit(religion);
  }
}
