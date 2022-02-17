import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingABCustom(width: width),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomNav(
              titulo: "Gestion de Clientes",
              height: height,
              width: width,
            ),
            ListViewPage(height: height),
          ],
        ),
      ),
    );
  }
}
