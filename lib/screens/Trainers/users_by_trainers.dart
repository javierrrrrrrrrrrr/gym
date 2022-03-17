import 'package:flutter/material.dart';
import 'package:gym/screens/Trainers/listview_users_by_trainer_body.dart';

import '../../helpers/custom_appbar.dart';

class UsersByTrainer extends StatefulWidget {
  const UsersByTrainer({Key? key}) : super(key: key);

  @override
  State<UsersByTrainer> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersByTrainer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(
        context,
        width: width,
        title: "Lista de Usuarios",
      ),
      body: Column(
        children: const [
          UsersByTrainerListView(),
        ],
      ),
    );
  }
}
