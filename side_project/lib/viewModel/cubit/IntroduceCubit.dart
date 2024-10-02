import 'package:flutter_bloc/flutter_bloc.dart';

class IntroduceCubit extends Cubit<List<String>> {
  IntroduceCubit() : super(List.generate(2, (index) => ''));

  void setText(int index, String text) {
    List<String> list = state.toList();
    list[index] = text;
    emit(list);
  }
}
