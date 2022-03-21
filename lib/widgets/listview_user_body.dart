import 'package:flutter/material.dart';
import 'package:gym/helpers/page_transitions.dart';
import 'package:gym/models/models.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/screens/pages.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

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

        await trainerProvider.getTrainers();
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
              child: GestureDetector(
                onTap: () {
                  _showUserInfoPopUp(context, user);
                },
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
                          color:
                              user.active == true ? Colors.green : Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
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
            Text(user.activeto.toString()),
            const SizedBox(
              width: 20,
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

                  await trainerProvider.getTrainers();
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

Future<void> _showUserInfoPopUp(BuildContext context, User user) async {
  final userProvider = Provider.of<UsersProvider>(context, listen: false);
  final userFormController =
      Provider.of<UserFormController>(context, listen: false);
  final trainerProvider = Provider.of<TrainerProvider>(context, listen: false);

  final width = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          insetPadding: const EdgeInsets.all(15),
          contentPadding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          content: Stack(
            children: [
              SizedBox(
                  height: width * 1.01,
                  width: width,
                  child: Column(
                    children: [
                      ImgUserContainer(
                        height: 120,
                        width: 100,
                        user: user,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PopUpBanner(
                        user: user,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButtonModal(
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

                                await trainerProvider.getTrainers();
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(context,
                                    crearRuta(screen: const EditUser()));
                              },
                              width: width,
                              icon: Icons.edit),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButtonModal(
                              onPressed: () async {
                                try {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  await userProvider
                                      .getObservationsByIdUser(user.id);
                                  userProvider.selectedUser = user.copyWith();
                                  userFormController.user = user.copyWith();

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      crearRuta(
                                          screen: const ListaObservaciones()));
                                } on Exception catch (e) {
                                  // TODO
                                }
                              },
                              width: width,
                              icon: Icons.remove_red_eye_sharp),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButtonModal(
                              onPressed: () async {
                                try {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  await userProvider
                                      .getAllPaymentsByUserId(user.id);
                                  userProvider.selectedUser = user.copyWith();
                                  userFormController.user = user.copyWith();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                      crearRuta(screen: const ListaPagos()));
                                } on Exception catch (e) {
                                  // TODO
                                }
                              },
                              width: width,
                              icon: Icons.payments_outlined),
                        ],
                      )
                    ],
                  )),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ));
    },
  );
}

class IconButtonModal extends StatelessWidget {
  const IconButtonModal({
    Key? key,
    required this.width,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(77, 82, 233, 1),
          borderRadius: BorderRadius.circular(50)),
      child: IconButton(
        icon: Icon(icon, size: width * 0.09, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

class PopUpBanner extends StatelessWidget {
  const PopUpBanner({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: width * 0.48,
      width: width * 0.87,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(77, 82, 233, 1),
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  "${user.firstname} ${user.lastname}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const Text("26",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PrimaryText(text: "Miembro"),
                  SecondaryText(
                    text: user.datetime!,
                  )
                ],
              ),
              Container(
                width: 2,
                height: width * 0.2036,
                color: const Color.fromRGBO(255, 255, 255, 0.8),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.0381),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PrimaryText(text: "Estado"),
                    SecondaryText(
                      active: user.active,
                      text: user.active == true ? "Active" : "Inactive",
                    )
                  ],
                ),
              ),
              Container(
                width: 2,
                height: width * 0.2036,
                color: const Color.fromRGBO(255, 255, 255, 0.8),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PrimaryText(text: "Vence"),
                  SecondaryText(
                    text: user.activeto.toString(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondaryText extends StatelessWidget {
  const SecondaryText({Key? key, required this.text, this.active})
      : super(key: key);
  final String text;
  final bool? active;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(text,
        style: TextStyle(
            fontSize: 16,
            color: active != null
                ? active!
                    ? const Color.fromRGBO(75, 232, 119, 1)
                    : Colors.red
                : Colors.white));
  }
}

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(text,
        style: const TextStyle(
          fontSize: 16,
          color: const Color.fromRGBO(255, 255, 255, 0.6),
        ));
  }
}
