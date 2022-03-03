import 'package:flutter/material.dart';

class FloatingABCustom extends StatelessWidget {
  const FloatingABCustom({
    Key? key,
    required this.route,
  }) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FloatingActionButton(
      backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
      onPressed: () {
        Navigator.pushNamed(context, route);
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
