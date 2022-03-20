import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gym/screens/pages.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';
import 'page_transitions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future verificarCredenciales() async {
      try {
        final loginProvaider =
            Provider.of<LoginProvider>(context, listen: false);
        String recordar = await loginProvaider.readDataFromStorage('recordar');
        if (recordar == "true") {
          loginProvaider.recordarContrasena = true;
          loginProvaider.contrsenaGuardada =
              await loginProvaider.readDataFromStorage('contrasena');
          loginProvaider.usuarioGuardado =
              await loginProvaider.readDataFromStorage('usuario');
        }
      } on Exception {
        Navigator.push(context, crearRuta(screen: const LoginPage()));
      }
    }

    return FutureBuilder(
        future: verificarCredenciales(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return AnimatedSplashScreen(
            splash:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Hero(tag: 'hero_id', child: Image.asset('assets/gym.jpeg')),
            ]),
            animationDuration: const Duration(milliseconds: 500),
            nextScreen: const LoginPage(),
            splashIconSize: 500,
            splashTransition: SplashTransition.scaleTransition,
          );
        });
  }
}
