import 'package:flutter/material.dart';

import '../models/usersmodel.dart';

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
  String services = "";

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
