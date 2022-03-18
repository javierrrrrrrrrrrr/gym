import 'package:flutter/material.dart';
import 'package:gym/helpers/page_transitions.dart';
import 'package:gym/models/models.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/screens/Users/edit_user.dart';
import 'package:provider/provider.dart';

class ListViewUserBody extends StatelessWidget {
  const ListViewUserBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    final userFormController = Provider.of<UserFormController>(context);
    final width = MediaQuery.of(context).size.width;
    final trainerProvider = Provider.of<TrainerProvider>(context);

    return GestureDetector(
      onTap: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
        userProvider.selectedUser = user.copyWith();
        userFormController.user = user.copyWith();

        trainerProvider.getTrainers();
        Navigator.pop(context);
        Navigator.push(context, crearRuta(screen: const EditUser()));
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
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  userProvider.selectedUser = user.copyWith();
                  userFormController.user = user.copyWith();

                  trainerProvider.getTrainers();
                  Navigator.pop(context);
                  Navigator.push(context, crearRuta(screen: const EditUser()));
                },
                icon: Icon(Icons.edit, size: width * 0.09),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
