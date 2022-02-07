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
        body: SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              CustomNav(
                titulo: "Gestion de Clientes",
                height: height,
                width: width,
              ),
              ListViewPage(height: height),
            ],
          ),
          Positioned(
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
              onPressed: () {
                Navigator.pushNamed(context, 'add_user');
              },
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: const Image(
                  color: Colors.white,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/add_user.png'),
                ),
              ),
            ),
            bottom: width * 0.09,
            right: width * 0.09,
          ),
        ],
      ),
    ));
  }
}
