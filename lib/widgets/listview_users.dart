import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

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

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: userProvider.users.length,
        itemBuilder: (BuildContext context, index) {
          return ListUserBody(
            user: userProvider.users[index],
          );
        },
        padding: const EdgeInsets.all(0),
        //  padding: const EdgeInsets.only(bottom: 10),
      ),
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
    final userFormController = Provider.of<UserFormController>(context);

    return SizedBox(
      height: 75,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: const AssetImage(
                      'assets/JovialMeagerBull-size_restricted.gif'),
                  foregroundImage: NetworkImage((user.img != "no-avatar.png")
                      ? 'http://78.108.216.56:3000/api/uploads/clients/${user.id}'
                      : 'https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=612x612&w=0&h=f-9tPXlFXtz9vg_-WonCXKCdBuPUevOBkp3DQ-i0xqo='),
                ),
                Positioned(
                  right: 0,
                  bottom: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 10,
                      width: 10,
                      color: user.active == true ? Colors.green : Colors.red,
                    ),
                  ),
                )
              ],
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
                userFormController.user = user;

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
