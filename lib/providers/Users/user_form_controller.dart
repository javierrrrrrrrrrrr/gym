import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';

class UserFormController extends ChangeNotifier {
  GlobalKey<FormState> userformkey = GlobalKey<FormState>();
  User? user;
  bool? training = false;
  bool? aerobics = false;
  bool? massage = false;

  UserFormController({this.user});

  changeDayActive() {
    if (user!.daysback == true) {
      user!.daysback = false;
    } else {
      user!.daysback = true;
    }

    notifyListeners();
  }

  bool isValidForm() {
    return userformkey.currentState?.validate() ?? false;
  }
}
