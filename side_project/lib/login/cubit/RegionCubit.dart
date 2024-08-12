import 'package:flutter_bloc/flutter_bloc.dart';

class RegionCubit extends Cubit<String?> {
  RegionCubit() : super(null);

  void setRegion(String? region) {
    emit(region);
  }
}
