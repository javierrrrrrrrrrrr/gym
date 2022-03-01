import 'package:flutter/material.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final userProvider = Provider.of<UsersProvider>(context);

    if (userProvider.isLoading == true) {
      userProvider
          .getUsers()
          .whenComplete(() => userProvider.isLoading = false);

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
            ListViewPage(height: height)
          ],
        ),
      );
    }
  }
}
