import 'package:flutter/material.dart';
import 'package:gym/screens/add_trainer.dart';
import 'package:gym/screens/add_user.dart';
import 'package:gym/screens/home_page.dart';
import 'package:gym/screens/panel_admin.dart';
import 'package:gym/screens/trainers.dart';
import 'package:gym/screens/users.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (BuildContext context) => const HomePage(),
  'Admin': (BuildContext context) => const PanelAdmin(),
  'users': (BuildContext context) => const UsersPage(),
  'trainers': (BuildContext context) => const TrainerPage(),
  'add_user': (BuildContext context) => const AddUser(),
  'add_trainer': (BuildContext context) => const AddTrainer(),
};
