import 'package:flutter/material.dart';

import '../../models/trainer_model.dart';

class TrainersFormController extends ChangeNotifier {
  GlobalKey<FormState> userformkey = GlobalKey<FormState>();
  Trainer? trainer;
  String? password;

  bool isValidForm() {
    return userformkey.currentState?.validate() ?? false;
  }
}
