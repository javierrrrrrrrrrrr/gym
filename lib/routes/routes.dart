import 'package:flutter/material.dart';
import 'package:gym/helpers/splash_screen.dart';

import 'package:gym/screens/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (BuildContext context) => const LoginPage(),
  'splash': (BuildContext context) => const SplashScreen(),
  //'admin': (BuildContext context) => const PanelAdmin(),
  'admin': (BuildContext context) => const DashboardPage(),
  'users': (BuildContext context) => const UsersPage(),
  'trainers': (BuildContext context) => const TrainerPage(),
  'add_user': (BuildContext context) => const AddUser(),
  'edit_user': (BuildContext context) => const EditUser(),
  'edit_trainer': (BuildContext context) => const EditTrainer(),
  'add_trainer': (BuildContext context) => const AddTrainer(),
  'ob': (BuildContext context) => const Observ(),
  'pago': (BuildContext context) => const Pagos(),
  'lista_obs': (BuildContext context) => const ListaObservaciones(),
  'lista_pagos': (BuildContext context) => const ListaPagos(),
  'charging_page': (BuildContext context) => const ChargingPage(),
};
