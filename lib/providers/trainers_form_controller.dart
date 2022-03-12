import 'package:flutter/material.dart';

class TrainersFormController extends ChangeNotifier {
  GlobalKey<FormState> userformkey = GlobalKey<FormState>();
  String nombre = '';
  String apellidos = '';
  String email = '';
  String password = '';

  bool isValidForm() {
    return userformkey.currentState?.validate() ?? false;
  }
}
