import 'package:flutter/material.dart';

class UserFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String firstname = "";
  String lastname = "";
  String age = "";
  String height = "";
  String weight = "";
  String email = "";
  String phone = "";
  String imc = "";
  String icc = "";
  List<String> services = [];
  bool? training = false;
  bool? aerobics = false;

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
