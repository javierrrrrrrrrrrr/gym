import 'package:flutter/material.dart';
import 'package:gym/models/usersmodel.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:provider/provider.dart';

import '../models/getUsersModel.dart';

class UserSerch extends SearchDelegate {
  @override
  String get searchFieldLabel => "Buscar Usuario";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = "", icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return empty();
    }

    final userProvaider = Provider.of<UsersProvider>(context, listen: false);
    userProvaider.getSuggestionByQuery(query);

    return StreamBuilder(
      stream: userProvaider.suggestionStream,
      builder: (_, AsyncSnapshot<List> snapshot) {
        if (!snapshot.hasData) return empty();

        final user = snapshot.data!;

        return ListView.builder(
            itemCount: user.length,
            itemBuilder: (_, index) => ListUserBody(user: user[index]));
      },

      //  padding: const EdgeInsets.only(bottom: 10),
    );
  }
}

class ListUserBody extends StatelessWidget {
  const ListUserBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    return SizedBox(
      height: 75,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: const AssetImage(
                  'assets/JovialMeagerBull-size_restricted.gif'),
              foregroundImage: NetworkImage((user.img != "no-avatar.png")
                  ? 'http://78.108.216.56:3000/api/uploads/clients/${user.id}'
                  : 'https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=612x612&w=0&h=f-9tPXlFXtz9vg_-WonCXKCdBuPUevOBkp3DQ-i0xqo='),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.firstname} ${user.lastname}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      Text(
                        user.phone,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                userProvider.selectedUser = user;

                Navigator.pushNamed(context, 'edit_user');
              },
              icon: const Icon(Icons.edit, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}

Center empty() {
  return const Center(
      child: Center(
    child: Icon(Icons.movie_creation_outlined),
  ));
}
