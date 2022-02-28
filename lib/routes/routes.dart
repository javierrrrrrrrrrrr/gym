import 'package:flutter/material.dart';

import 'package:gym/screens/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (BuildContext context) => const HomePage(),
  'admin': (BuildContext context) => const PanelAdmin(),
  'users': (BuildContext context) => const UsersPage(),
  'trainers': (BuildContext context) => const TrainerPage(),
  'add_user': (BuildContext context) => const AddUser(),
  'edit_user': (BuildContext context) => const EditUser(),
  'add_trainer': (BuildContext context) => const AddTrainer(),
  'ob': (BuildContext context) => const Observ(),
  'pago': (BuildContext context) => const Pagos(),
  'lista_obs': (BuildContext context) => const ListaObservaciones(),
  'lista_pagos': (BuildContext context) => const ListaPagos(),
};
