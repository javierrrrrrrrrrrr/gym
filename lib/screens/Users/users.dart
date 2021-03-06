import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';
import 'package:gym/providers/Users/users_provider.dart';
import 'package:gym/search/search_delegate.dart';

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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(
        context,
        width: width,
        centerTitle: false,
        title: "Usuarios",
        actions: [
          (userProvider.sinPagar == false)
              ? IconButton(
                  iconSize: width * 0.080,
                  onPressed: () {
                    userProvider.sinPagar = true;
                  },
                  icon: const Icon(Icons.attach_money))
              : IconButton(
                  iconSize: width * 0.080,
                  onPressed: () {
                    userProvider.sinPagar = false;
                  },
                  icon: const Icon(Icons.money_off)),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: UserSerch());
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: width * 0.080,
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingABCustom(
        isUser: true,
        route: "add_user",
      ),
      body: Column(
        children: const [
          ListViewUsers(),
        ],
      ),
    );
  }
}
