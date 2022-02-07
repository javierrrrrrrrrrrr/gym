import 'package:flutter/material.dart';
import 'package:gym/screens/pages.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomePage(),
        'Admin': (BuildContext context) => const PanelAdmin(),
        'users': (BuildContext context) => const UsersPage(),
      },
    );
  }
}
