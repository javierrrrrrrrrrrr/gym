import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';
import 'package:gym/providers/providers.dart';
import 'package:provider/provider.dart';

class FloatingABCustom extends StatelessWidget {
  const FloatingABCustom({
    Key? key,
    required this.route,
  }) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(context);

    final width = MediaQuery.of(context).size.width;
    return FloatingActionButton(
      backgroundColor: const Color.fromRGBO(77, 82, 233, 1),
      onPressed: () {
        userFormController.user = User(
          id: '',
          firstname: '',
          age: 0,
          height: '',
          lastname: '',
          phone: '',
          services: [],
          weight: '',
          email: '',
          icc: '',
          imc: '',
        );

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
