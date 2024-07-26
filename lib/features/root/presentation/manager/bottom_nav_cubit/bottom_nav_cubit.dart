import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }
}
