import 'package:flutter/material.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:provider/provider.dart';

import '../models/users_model.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: userProvider.users.length,
        itemBuilder: (BuildContext context, index) {
          return ListUserWidget(user: userProvider.users[index]);
        },
        padding: const EdgeInsets.all(0),
        //  padding: const EdgeInsets.only(bottom: 10),
      ),
    );
  }
}

class ListUserWidget extends StatelessWidget {
  const ListUserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      dense: true,
      leading: Stack(
        children: [
          Image(
            width: height * 0.09,
            height: height * 0.09,
            fit: BoxFit.cover,
            image: const AssetImage('assets/user.png'),
          ),
          Positioned(
            bottom: 0,
            right: height * 0.015,
            child: Container(
              height: height * 0.012,
              width: height * 0.012,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.01),
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "${user.firstname} ${user.lastname}",
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.phone),
          Text(
            user.phone,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
      trailing: const Icon(
        Icons.edit,
        size: 40,
      ),
    );
  }
}
