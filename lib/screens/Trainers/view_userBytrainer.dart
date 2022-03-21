import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';
import 'package:gym/helpers/page_transitions.dart';
import 'package:gym/models/models.dart';
import 'package:gym/screens/pages.dart';

import 'package:provider/provider.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';

class ViewUserByTrainer extends StatefulWidget {
  const ViewUserByTrainer({Key? key}) : super(key: key);

  @override
  State<ViewUserByTrainer> createState() => _ViewUserByTrainerState();
}

class _ViewUserByTrainerState extends State<ViewUserByTrainer> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final userProvider = Provider.of<UsersProvider>(context);

    User user = userProvider.selectedUser!;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      appBar: customAppbar(context, width: width, title: "Ver Usuario"),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      color: const Color.fromRGBO(253, 254, 255, 1),
                      child: Column(children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Nombre'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.firstname,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onChanged: ((value) {}),
                          width: width,
                        ),
                        _separador(height),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Apellidos'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.lastname,
                          obscureText: false,
                          onChanged: (value) {},
                          keyboardType: TextInputType.text,
                          width: width,
                        ),
                        _separador(height),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Telefono'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.phone,
                          obscureText: false,
                          onChanged: (value) {},
                          keyboardType: TextInputType.text,
                          width: width,
                        ),
                        _separador(height),

                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Edad'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue:
                              userProvider.selectedUser!.age.toString(),
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          width: width,
                        ),
                        _separador(height),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Estatura'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.height,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          width: width,
                        ),
                        _separador(height),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Peso'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.weight,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          width: width,
                        ),
                        _separador(height),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Imc'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.imc,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          width: width,
                        ),
                        _separador(height),
                        InputFieldWidget(
                          enabled: false,
                          label: const Text('Icc'),
                          icon: false,
                          maxline: 1,
                          right: 55,
                          left: 25,
                          initialvalue: userProvider.selectedUser!.icc,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          width: width,
                        ),
                        _separador(height),

                        // DropDown List;
                      ]),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          MenuLateral(
              height: height,
              width: width,
              userProvider: userProvider,
              user: user),
          const EditUserImg()
        ],
      ),
    );
  }

  SizedBox _separador(double height) {
    return SizedBox(
      height: height * 0.02,
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    Key? key,
    required this.height,
    required this.width,
    required this.userProvider,
    required this.user,
  }) : super(key: key);

  final double height;
  final double width;
  final UsersProvider userProvider;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: height / 3.2,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(77, 82, 233, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        height: width * 0.19,
        width: width * 0.12,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            icon: const Icon(
              Icons.remove_red_eye_sharp,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
              await userProvider
                  .getObservationsByIdUser(user.id)
                  .whenComplete(() {
                Navigator.pop(context);
                Navigator.push(
                    context, crearRuta(screen: const ListaObservaciones()));
              });
            },
          ),
        ]),
      ),
    );
  }
}
