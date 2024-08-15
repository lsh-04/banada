import 'package:flutter_bloc/flutter_bloc.dart';

class PoliticsCubit extends Cubit<String?> {
  PoliticsCubit() : super(null);

  void setPolitics(String? politics) {
    emit(politics);
  }
}
