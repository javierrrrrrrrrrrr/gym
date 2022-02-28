import 'package:flutter/material.dart';

class LoginFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}