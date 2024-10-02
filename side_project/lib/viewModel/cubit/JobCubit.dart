import 'package:flutter_bloc/flutter_bloc.dart';

class JoBCubit extends Cubit<String?> {
  JoBCubit() : super(null);

  void setJoB(String? joB) {
    emit(joB);
  }
}
