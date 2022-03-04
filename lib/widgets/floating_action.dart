import 'dart:math';

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
    final userProvider = Provider.of<UsersProvider>(context);

    final width = MediaQuery.of(context).size.width;
    return FloatingActionButton(
      backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
      onPressed: () {
        const _chars =
            'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        Random _rnd = Random();
        String getRandomString(int length) =>
            String.fromCharCodes(Iterable.generate(
                length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
        userProvider.selectedUser = User(
            id: getRandomString(24),
            firstname: '',
            age: 0,
            height: '',
            lastname: '',
            phone: '',
            services: ["Training"],
            weight: '');

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
