import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:gym/models/Users/getUsersModel.dart';
import 'package:gym/providers/providers.dart';
import 'package:provider/provider.dart';

class UsersByTrainerListView extends StatefulWidget {
  const UsersByTrainerListView({
    Key? key,
  }) : super(key: key);

  @override
  State<UsersByTrainerListView> createState() => _UsersByTrainerListViewState();
}

class _UsersByTrainerListViewState extends State<UsersByTrainerListView> {
  @override
  Widget build(BuildContext context) {
    final trainerProvider = Provider.of<TrainerProvider>(context);

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: trainerProvider.usersByTrainer.length,
        itemBuilder: (BuildContext context, index) {
          return ListUserBody(
            user: trainerProvider.usersByTrainer[index],
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
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UsersProvider>(context);
    final userFormController = Provider.of<UserFormController>(context);

    return GestureDetector(
      onTap: () async {
        try {
          userProvider.selectedUser = user.copyWith();

          Navigator.pushNamed(context, 'view_userBytrainer');
        } on Exception catch (e) {
          ElegantNotification.error(
            toastDuration: const Duration(milliseconds: 3000),
            animation: ANIMATION.fromRight,
            title: const Text('Error'),
            description: const Text('Problemas de conexion'),
          ).show(context);
        }
      },
      child: SizedBox(
        height: width * 0.19,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.025),
              child: Stack(
                children: [
                  (user.img != "no-avatar.png")
                      ? Hero(
                          tag: user.id,
                          child: CircleAvatar(
                            radius: width * 0.065,
                            backgroundImage:
                                const AssetImage('assets/images.jpg'),
                            foregroundImage: NetworkImage(
                                'http://181.225.253.122:3000/api/uploads/clients/${user.id}'),
                          ),
                        )
                      : Hero(
                          tag: user.id,
                          child: CircleAvatar(
                            radius: width * 0.065,
                            backgroundImage:
                                const AssetImage('assets/images.jpg'),
                          ),
                        ),
                  Positioned(
                    right: 0,
                    bottom: width * 0.012,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.080),
                      child: Container(
                        height: width * 0.025,
                        width: width * 0.025,
                        color: user.active == true ? Colors.green : Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstname} ${user.lastname}",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        Text(
                          user.phone,
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: IconButton(
                onPressed: () async {
                  try {
                    userProvider.selectedUser = user.copyWith();

                    Navigator.pushNamed(context, 'view_userBytrainer');
                  } on Exception catch (e) {
                    ElegantNotification.error(
                      toastDuration: const Duration(milliseconds: 3000),
                      animation: ANIMATION.fromRight,
                      title: const Text('Error'),
                      description: const Text('Problemas de conexion'),
                    ).show(context);
                  }
                },
                icon: Icon(Icons.remove_red_eye_sharp, size: width * 0.09),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
