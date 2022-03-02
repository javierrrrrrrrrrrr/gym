import 'package:flutter/material.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:gym/screens/prueba.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingABCustom(
        width: width,
        route: "add_user",
      ),
      body: Column(
        children: [
          CustomNav(
            titulo: "Gestion de Clientes",
            height: height,
            width: width,
          ),
          userProvider.isLoading ? const Prueba() : const ListViewUsers(),
        ],
      ),
    );
  }
}
