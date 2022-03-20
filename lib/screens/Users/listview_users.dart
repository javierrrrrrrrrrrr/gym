import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/listview_user_body.dart';
import 'package:provider/provider.dart';

class ListViewUsers extends StatefulWidget {
  const ListViewUsers({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewUsers> createState() => _ListViewUsersState();
}

class _ListViewUsersState extends State<ListViewUsers> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    if (userProvider.sinPagar == false) {
      return Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: userProvider.users.length,
          itemBuilder: (BuildContext context, index) {
            return userProvider.users.isEmpty
                ? const Icon(Icons.no_accounts)
                : ListViewUserBody(
                    user: userProvider.users[index],
                  );
          },
          padding: const EdgeInsets.all(0),
          //  padding: const EdgeInsets.only(bottom: 10),
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: userProvider.usersSinPagar.length,

          itemBuilder: (BuildContext context, index) {
            return ListViewUserBody(user: userProvider.usersSinPagar[index]);
          },
          padding: const EdgeInsets.all(0),
          //  padding: const EdgeInsets.only(bottom: 10),
        ),
      );
    }
  }
}
