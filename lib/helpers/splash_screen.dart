import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gym/screens/pages.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10)).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        Image.asset('assets/gym-1.gif'),
        const Text(
          "GYM Fitness Model",
          style: TextStyle(fontSize: 36),
        ),
      ]),
      nextScreen: const LoginPage(),
      splashIconSize: 500,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
