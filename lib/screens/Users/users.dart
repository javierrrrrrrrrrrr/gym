import 'package:flutter/material.dart';
import 'package:gym/providers/Users/users_provider.dart';

import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_appbar.dart';
import '../../search/search_delegate.dart';

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
                  onPressed: () {
                    userProvider.sinPagar = true;
                  },
                  icon: const Icon(Icons.attach_money))
              : IconButton(
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
              color: const Color.fromRGBO(150, 152, 154, 0.5),
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
          // Center(
          //   child: Text("Lista de usuarios"),
          // ),
          ListViewUsers(),
        ],
      ),
    );
  }
}
