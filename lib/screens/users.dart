import 'package:flutter/material.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:gym/screens/charging_page.dart';
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
    final userProvider = Provider.of<UsersProvider>(context);

    return Scaffold(
      floatingActionButton: const FloatingABCustom(
        route: "add_user",
      ),
      body: Column(
        children: [
          const CustomNav(
            title: "Gestion de Clientes",
          ),
          userProvider.isLoading ? const ChargingPage() : const ListViewUsers(),
        ],
      ),
    );
  }
}
