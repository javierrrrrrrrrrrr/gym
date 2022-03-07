import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';
import 'package:provider/provider.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  void initState() {
    super.initState();
    final userFormController =
        Provider.of<UserFormController>(context, listen: false);
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    if (userProvider.selectedUser!.services.contains("TRAINING")) {
      userFormController.training = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userFormController = Provider.of<UserFormController>(context);
    final userProvider = Provider.of<UsersProvider>(context);
    final imageProvider = Provider.of<SelectImg>(context, listen: false);
    User user = userProvider.selectedUser!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: const Color.fromRGBO(253, 254, 255, 1),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: userFormController.userformkey,
                child: Column(
                  children: [
                    const BannerTop(title: "Editar Cliente"),
                    const EditUserImg(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.firstname,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      onChanged: ((value) {
                        userFormController.user!.firstname = value;
                      }),
                      validator: (value) {
                        if (value!.length > 1 && value != "") {
                          return null;
                        } else {
                          return "El nombre debe tener al menos un caracter :)";
                        }
                      },
                      width: width,
                      hinttext: 'Nombre',
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.lastname,
                      obscureText: false,
                      onChanged: (value) =>
                          userFormController.user!.lastname = value,
                      keyboardType: TextInputType.text,
                      width: width,
                      hinttext: 'Apellidos',
                      validator: (value) {
                        if (value!.length > 1 && value != "" || value == "") {
                          return null;
                        } else {
                          return "El apellido debe tener al menos un caracter :)";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.phone,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) =>
                          userFormController.user!.phone = value,
                      width: width,
                      hinttext: 'Teléfono',
                      validator: (value) {
                        if (value != null && value.length > 5 && value != "" ||
                            value == "") {
                          return null;
                        } else {
                          return "Un numero de telefono valido contiene al menos 5 caracteres :)";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.email ?? '',
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) =>
                          userFormController.user!.email = value,
                      width: width,
                      hinttext: 'Email',
                      validator: (value) {
                        String gmailpatter =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = RegExp(gmailpatter);
                        if (regExp.hasMatch(value ?? "") || value == "") {
                          return null;
                        } else {
                          return 'Introduce un correo valido';
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.age.toString(),
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          userFormController.user!.age = int.parse(value),
                      width: width,
                      hinttext: 'Edad',
                      validator: (value) {
                        String edadpattern = r'^([0-9])*$';
                        var edad = RegExp(edadpattern);

                        if (edad.hasMatch(value ?? "") &&
                                value != null &&
                                value.length < 3 &&
                                value != "" ||
                            value == "") {
                          return null;
                        } else {
                          return "La edad debe ser menor de 3 caracteres :)";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.height,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          userFormController.user!.height = value,
                      width: width,
                      hinttext: 'Estatura',
                      validator: (value) {
                        var edad = RegExp(r'^([0-9])*$');

                        if (edad.hasMatch(value ?? "") &&
                                value != null &&
                                value.length < 4 &&
                                value != "" ||
                            value == "") {
                          return null;
                        } else {
                          return "La estatura debe ser menor de 4 caracteres :)";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.weight,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          userFormController.user!.weight = value,
                      width: width,
                      hinttext: 'Peso',
                      validator: (value) {
                        var edad = RegExp(r'^([0-9])*$');

                        if (edad.hasMatch(value ?? "") &&
                                value != null &&
                                value.length < 4 &&
                                value != "" ||
                            value == "") {
                          return null;
                        } else {
                          return "El peso debe ser menor de 4 caracteres :)";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.imc!,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          userFormController.user!.imc = value,
                      width: width,
                      hinttext: 'Imc',
                      validator: (value) {
                        var edad = RegExp(r'^([0-9])*$');

                        if (edad.hasMatch(value ?? "") &&
                                value != null &&
                                value.length < 3 &&
                                value != "" ||
                            value == "") {
                          return null;
                        } else {
                          return "El IMC debe ser menor de 4 caracteres :)";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.icc ?? '',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          userFormController.user!.icc = value,
                      width: width,
                      hinttext: 'Icc',
                      validator: (value) {
                        var edad = RegExp(r'^([0-9])*$');

                        if (edad.hasMatch(value ?? "") &&
                                value != null &&
                                value.length < 3 &&
                                value != "" ||
                            value == "") {
                          return null;
                        } else {
                          return "EL ICC debe ser menor de 4 caracteres :)";
                        }
                      },
                    ),
                    _separador(height),

                    // DropDown List;

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Container(
                        margin: const EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text("TRAINING"),
                          value: userFormController.training,
                          onChanged: (bool? value) {
                            setState(() {
                              userFormController.training = value;
                              if (userFormController.training == true) {
                                userFormController.user!.services
                                    .add("TRAINING");
                              } else {
                                userFormController.user!.services
                                    .remove("TRAINING");
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    _separador(height),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Container(
                        margin: const EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text("AEROBICS"),
                          value: userFormController.aerobics,
                          onChanged: (bool? value) {
                            setState(() {
                              userFormController.aerobics = value;
                              if (userFormController.aerobics == true) {
                                userFormController.user!.services
                                    .add("AEROBICS");
                              } else {
                                userFormController.user!.services
                                    .remove("AEROBICS");
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    _separador(height),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Container(
                        margin: const EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text("MASSAGE"),
                          value: userFormController.massage,
                          onChanged: (bool? value) {
                            setState(() {
                              userFormController.massage = value;
                              if (userFormController.massage == true) {
                                userFormController.user!.services
                                    .add("MASSAGE");
                              } else {
                                userFormController.user!.services
                                    .remove("MASSAGE");
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomButton(
                      title: "Guardar",
                      onPressed: () async {
                        if (userFormController.isValidForm()) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });

                          String? userid = await userProvider.updateUser(
                              user: userFormController.user!);

                          if (imageProvider.isTouch == false) {
                            //no se llama la peticion por que aprendimos a organizar la lista//
                            //  await userProvider.getUsers();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            imageProvider.isTouch = false;
                            await userProvider.uploadImage(
                                imageProvider.imagePath!, userid!);
                            //Evaluar si se puede borrar de aqui el metodo de abajo :)
                            //await userProvider.getUsers();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                    _separador(height),
                    CustomButton(
                        color: Colors.red[400],
                        onPressed: () async {
                          _showMyDialog(context, user.id);
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return const Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     });

                          // Navigator.pop(context);
                          // Navigator.pushReplacementNamed(context, 'users');
                        },
                        title: "Borrar Usuario"),
                    _separador(height),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: height / 2.4,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 49, 146, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                height: 140,
                width: 48,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.payments_outlined,
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
                              .getAllPaymentsByUserId(user.id)
                              .whenComplete(() {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'lista_pagos');
                          });
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                            Navigator.pushNamed(context, 'lista_obs');
                          });
                        },
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _separador(double height) {
    return SizedBox(
      height: height * 0.02,
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String id) async {
  final userProvider = Provider.of<UsersProvider>(context, listen: false);
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Borrar usuario'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Esta accion borrara de forma permanente el usuario del sistema',
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '¿ Desea Continuar ?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Si'),
            onPressed: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
              await userProvider.deleteUser(id);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'users');
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
