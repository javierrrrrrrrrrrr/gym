import 'package:flutter/material.dart';
import 'package:gym/providers/login_form_controller.dart';
import 'package:gym/providers/login_provider.dart';
import 'package:gym/providers/user_form_controller.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:gym/routes/routes.dart';
import 'package:provider/provider.dart';

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
        lazy: false,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
