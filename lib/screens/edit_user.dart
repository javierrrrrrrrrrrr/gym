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
    userFormController.firstname = '';
    userFormController.lastname = '';
    userFormController.age = '';
    userFormController.height = '';
    userFormController.weight = '';
    userFormController.email = '';
    userFormController.phone = '';
    userFormController.imc = '';
    userFormController.icc = '';
    userFormController.services = [];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userFormController = Provider.of<UserFormController>(context);
    final userProvider = Provider.of<UsersProvider>(context);
    User user = userProvider.selectedUser!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: const Color.fromRGBO(253, 254, 255, 1),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: userFormController.formkey,
                child: Column(
                  children: [
                    BannerTop(
                        height: height, width: width, title: "Editar Cliente"),
                    EditUserImg(width: width, height: height),
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
                        userFormController.firstname = value;
                      }),
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
                      onChanged: (value) => userFormController.lastname = value,
                      keyboardType: TextInputType.text,
                      width: width,
                      hinttext: 'Apellidos',
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
                      onChanged: (value) => userFormController.phone = value,
                      width: width,
                      hinttext: 'Teléfono',
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.email!,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => userFormController.email = value,
                      width: width,
                      hinttext: 'Email',
                      validator: (value) {
                        String gmailpatter =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = RegExp(gmailpatter);
                        if (regExp.hasMatch(value ?? "")) {
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
                      onChanged: (value) => userFormController.age = value,
                      width: width,
                      hinttext: 'Edad',
                      validator: (value) {
                        if (value != null && value.length < 3) {
                          return null;
                        } else {
                          return "La edad debe ser una edad logica";
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
                      onChanged: (value) => userFormController.height = value,
                      width: width,
                      hinttext: 'Estatura',
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return null;
                        } else {
                          return "La altura debe ser de solo 3 digitos";
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
                      onChanged: (value) => userFormController.weight = value,
                      width: width,
                      hinttext: 'Peso',
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return null;
                        } else {
                          return "El peso debe ser de solo 3 digitos";
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
                      onChanged: (value) => userFormController.imc = value,
                      width: width,
                      hinttext: 'Imc',
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return null;
                        } else {
                          return "El Imc debe ser de solo 3 digitos";
                        }
                      },
                    ),
                    _separador(height),
                    InputFieldWidget(
                      icon: true,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: user.icc!,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => userFormController.icc = value,
                      width: width,
                      hinttext: 'Icc',
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return null;
                        } else {
                          return "El Icc debe ser de solo 3 digitos";
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
                          title: const Text("Training"),
                          value: userFormController.training,
                          onChanged: (bool? value) {
                            setState(() {
                              userFormController.training = value;
                              if (userFormController.training == true) {
                                userFormController.services.add("TRAINING");
                              } else {
                                userFormController.services.remove("TRAINING");
                              }
                            });
                            print(userFormController.services);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: CheckboxListTile(
                        title: const Text("Aerobics"),
                        value: userFormController.aerobics,
                        onChanged: (bool? value) {
                          setState(() {
                            userFormController.aerobics = value;
                            if (userFormController.aerobics == true) {
                              userFormController.services.add("AEROBICS");
                            } else {
                              userFormController.services.remove("AEROBICS");
                            }
                          });
                          print(userFormController.services);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomButton(
                      title: "Guardar",
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        final imageProvider =
                            Provider.of<SelectImg>(context, listen: false);

                        String userid = await userProvider.updateUser(
                          id: user.id,
                          firstname: userFormController.firstname == ''
                              ? user.firstname
                              : userFormController.firstname,
                          lastname: userFormController.lastname == ''
                              ? user.lastname
                              : userFormController.lastname,
                          age: userFormController.age == ''
                              ? user.age
                              : int.parse(userFormController.age),
                          height: userFormController.height == ''
                              ? user.height
                              : userFormController.height,
                          weight: userFormController.weight == ''
                              ? user.weight
                              : userFormController.weight,
                          email: userFormController.email == ''
                              ? user.email!
                              : userFormController.email,
                          phone: userFormController.phone == ''
                              ? user.phone
                              : userFormController.phone,
                          imc: userFormController.imc == ''
                              ? user.imc!
                              : userFormController.imc,
                          icc: userFormController.icc == ''
                              ? user.icc!
                              : userFormController.icc,
                          services: userFormController.services,
                        );

                        if (imageProvider.isTouch == false) {
                          await userProvider.getUsers();
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, 'users');
                        } else {
                          await userProvider.uploadImage(
                              imageProvider.imagePath!, userid);
                          //Evaluar si se puede borrar de aqui el metodo de abajo :)
                          await userProvider.getUsers();
                        }
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, 'users');
                      },
                    ),
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
                        onPressed: () {
                          Navigator.pushNamed(context, 'lista_pagos');
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
                        onPressed: () {
                          Navigator.pushNamed(context, 'lista_obs');
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
