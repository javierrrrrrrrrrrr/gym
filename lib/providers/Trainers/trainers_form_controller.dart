import 'package:flutter/material.dart';

import '../../models/trainer_model.dart';

class TrainersFormController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Trainer? trainer;
  String? password;

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
