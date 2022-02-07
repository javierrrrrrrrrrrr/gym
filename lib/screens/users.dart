import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

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
        body: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            CustomNav(
              titulo: "Gestion de Clientes",
              height: height,
              width: width,
            ),
            // SizedBox(
            //   height: height * 0.1,
            // ),
            SizedBox(
              height: height * 0.70,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        listitem(),
                        listitem(),
                        listitem(),
                        listitem(),
                      ],
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Image(
                color: Colors.white,
                fit: BoxFit.cover,
                image: AssetImage('assets/add_user.png'),
              ),
            ),
          ),
          bottom: 30,
          right: 30,
        ),
      ],
    ));
  }

  ListTile listitem() {
    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      dense: true,
      minLeadingWidth: 45,
      leading: const Image(
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        image: AssetImage('assets/user.png'),
      ),
      title: const Text(
        "Adonys Valdes Arencibia",
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Row(
        children: const [
          Icon(Icons.phone),
          Text(
            '+5358542967',
            style: TextStyle(fontSize: 20),
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
