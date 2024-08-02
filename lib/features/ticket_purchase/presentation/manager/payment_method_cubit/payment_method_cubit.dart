import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodCubit extends Cubit<int> {
  PaymentMethodCubit() : super(-1);  // Initial state: no selection

  void selectPaymentMethod(int index) {
    emit(state == index ? -1 : index);  // Toggle selection
  }
}
