import 'package:flutter/material.dart';

class FloatingABCustom extends StatelessWidget {
  const FloatingABCustom({
    Key? key,
    required this.width,
    required this.route,
  }) : super(key: key);

  final double width;
  final String route;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
      onPressed: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: const Image(
          color: Colors.white,
          fit: BoxFit.cover,
          image: AssetImage('assets/add_user.png'),
        ),
      ),
    );
  }
}
