import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/routes/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginFormController(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => UserFormController(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => UsersProvider(),
        lazy: true,
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: "Gym",
      debugShowCheckedModeBanner: false,
      initialRoute: 'admin',
      routes: appRoutes,
    );
  }
}
