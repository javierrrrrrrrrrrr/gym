import 'package:flutter/material.dart';
import 'package:gym/screens/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (BuildContext context) => const HomePage(),
  'Admin': (BuildContext context) => const PanelAdmin(),
  'users': (BuildContext context) => const UsersPage(),
  'trainers': (BuildContext context) => const TrainerPage(),
  'add_user': (BuildContext context) => const AddUser(),
  'add_trainer': (BuildContext context) => const AddTrainer(),
};
