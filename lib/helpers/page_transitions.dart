import 'package:flutter/material.dart';

Route crearRuta({required screen}) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          screen,

      // transitionDuration:const Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: const Offset(1.5, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
        );
      });
}
