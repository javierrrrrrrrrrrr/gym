import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';

class UserFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  User? user;
  bool? training = false;
  bool? aerobics = false;

  UserFormController({this.user});

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
