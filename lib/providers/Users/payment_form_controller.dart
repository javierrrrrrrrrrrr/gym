import 'package:flutter/cupertino.dart';

class PaymentFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String amount = '';
  String cantMeses = '';
  double cantXMes = 0;
  String xCientodescuento = '';
  String comentario = '';

  updateCantXMes() {
    cantXMes = double.parse(amount) / double.parse(cantMeses);
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
