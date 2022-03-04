import 'package:flutter/material.dart';
import 'package:gym/providers/payment_form_controller.dart';

import 'package:provider/provider.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/routes/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UsersProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => LoginFormController(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => PaymentFormController(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => ObservationFormController(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => SelectImg(),
        lazy: true,
      ),
    ],
    child: const GymApp(),
  ));
}

class GymApp extends StatelessWidget {
  const GymApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsersProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => UserFormController(user: user.selectedUser!),
      lazy: true,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: "Gym",
        debugShowCheckedModeBanner: false,
        initialRoute: 'admin',
        routes: appRoutes,
      ),
    );
  }
}
