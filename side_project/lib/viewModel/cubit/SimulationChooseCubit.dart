import 'package:flutter_bloc/flutter_bloc.dart';

class SimulationChooseCubit extends Cubit<List<int>> {
  SimulationChooseCubit() : super(List.generate(16, (index) => 0));

  void setChoose(int index, int choose) {
    List<int> copy = state.toList();
    copy[index] = choose;
    emit(copy);
  }
}
