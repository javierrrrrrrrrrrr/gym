import 'package:flutter/material.dart';

class LoginFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isvalidEmail = false;
  bool _isvalidPassw = false;

  bool get isvalidEmail => _isvalidEmail;
  bool get isvalidPassw => _isvalidPassw;

  set setisvalidEmails(valor) {
    _isvalidEmail = valor;
    notifyListeners();
  }

  set setisvalidPassw(valor) {
    _isvalidPassw = valor;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
