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
    final width = MediaQuery.of(context).size.width;

    if (userProvider.sinPagar == false) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: (() async {
            await userProvider.getUsers();
          }),
          child: userProvider.users.isEmpty
              ? Center(
                  child: Icon(
                  Icons.no_accounts,
                  color: Colors.blue,
                  size: width * 0.50,
                ))
              : ListView.builder(
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
        ),
      );
    } else {
      return Expanded(
        child: userProvider.usersSinPagar.isEmpty
            ? Center(
                child: Icon(
                Icons.no_accounts,
                color: Colors.blue,
                size: width * 0.50,
              ))
            : ListView.builder(
                itemCount: userProvider.usersSinPagar.length,

                itemBuilder: (BuildContext context, index) {
                  return ListViewUserBody(
                      user: userProvider.usersSinPagar[index]);
                },
                padding: const EdgeInsets.all(0),
                //  padding: const EdgeInsets.only(bottom: 10),
              ),
      );
    }
  }
}
