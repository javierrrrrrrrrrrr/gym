import 'package:flutter/cupertino.dart';

class ObservationFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String comment = '';
  String peso = '';
  String imc = '';
  String icc = '';

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
