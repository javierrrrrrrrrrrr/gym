import 'package:flutter/material.dart';
import 'package:gym/providers/Users/users_provider.dart';
import 'package:gym/widgets/listview_user_body.dart';
import 'package:provider/provider.dart';

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
    return const Text('');
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
        if (!snapshot.hasData) {
          return const Image(image: AssetImage('assets/ic.gif'));
        }

        final user = snapshot.data!;

        if (user.isEmpty) {
          return const Image(image: AssetImage('assets/triste.gif'));
        }

        return ListView.builder(
            itemCount: user.length,
            itemBuilder: (_, index) => ListViewUserBody(user: user[index]));
      },

      //  padding: const EdgeInsets.only(bottom: 10),
    );
  }
}

Center empty() {
  return const Center(
      child: Center(
    child: Icon(Icons.movie_creation_outlined),
  ));
}
