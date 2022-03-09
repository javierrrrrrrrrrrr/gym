import 'package:flutter/material.dart';

import 'package:gym/widgets/widgets.dart';

import '../search/search_delegate.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: UserSerch());
            },
            icon: Icon(
              Icons.search,
              color: const Color.fromRGBO(150, 152, 154, 0.5),
              size: width * 0.090,
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
        title: const Text("GYM Fitness Model"),
      ),
      floatingActionButton: const FloatingABCustom(
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
