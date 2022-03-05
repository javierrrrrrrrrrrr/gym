import 'package:flutter/material.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:provider/provider.dart';

import '../models/getUsersModel.dart';
import '../models/usersmodel.dart';

class ListViewTrainers extends StatefulWidget {
  const ListViewTrainers({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewTrainers> createState() => _ListViewUsersState();
}

class _ListViewUsersState extends State<ListViewTrainers> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    // final trainerProvider = Provider.of<TrainerProvider>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: userProvider.users.length,
        itemBuilder: (BuildContext context, index) {
          return ListTrainerWidget(user: userProvider.users[index]);
        },
        padding: const EdgeInsets.all(0),
        //  padding: const EdgeInsets.only(bottom: 10),
      ),
    );
  }
}

class ListTrainerWidget extends StatelessWidget {
  const ListTrainerWidget({
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
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage((user.img != "no-avatar.png")
                        ? 'http://152.206.177.70:3000/api/uploads/clients/${user.id}'
                        : 'https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=612x612&w=0&h=f-9tPXlFXtz9vg_-WonCXKCdBuPUevOBkp3DQ-i0xqo='))),
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

                Navigator.pushReplacementNamed(context, 'edit_user');
              },
              icon: const Icon(Icons.edit, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
