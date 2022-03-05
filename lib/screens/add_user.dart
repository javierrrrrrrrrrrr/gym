import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  void initState() {
    super.initState();
    final imageProvider = Provider.of<SelectImg>(context, listen: false);
    imageProvider.imagePath = "";
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userFormController = Provider.of<UserFormController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(253, 254, 255, 1),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: userFormController.formkey,
            child: Column(
              children: [
                const BannerTop(title: "Crear Cliente"),
                SelectIMGWidget(width: width, height: height),
                SizedBox(
                  height: height * 0.02,
                ),
                InputFieldWidget(
                  icon: true,
                  maxline: 1,
                  right: 55,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  onChanged: ((value) {
                    userFormController.user!.firstname = value;
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
                  initialvalue: "",
                  obscureText: false,
                  onChanged: (value) =>
                      userFormController.user!.lastname = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => userFormController.user!.phone = value,
                  width: width,
                  hinttext: 'Teléfono',
                ),
                _separador(height),
                InputFieldWidget(
                  icon: true,
                  maxline: 1,
                  right: 55,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => userFormController.user!.email = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      userFormController.user!.age = int.parse(value),
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.height = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.weight = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.imc = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.icc = value,
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
                            userFormController.user!.services.add("TRAINING");
                          } else {
                            userFormController.user!.services
                                .remove("TRAINING");
                          }
                        });
                        print(userFormController.user!.services);
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
                          userFormController.user!.services.add("AEROBICS");
                        } else {
                          userFormController.user!.services.remove("AEROBICS");
                        }
                      });
                      print(userFormController.user!.services);
                    },
                  ),
                ),

                const SizedBox(
                  height: 100,
                ),
                CustomButton(
                  title: "Crear",
                  onPressed: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });

                    final imageProvider =
                        Provider.of<SelectImg>(context, listen: false);

                    final userProvider =
                        Provider.of<UsersProvider>(context, listen: false);

                    final userId = await userProvider.createUser(
                        user: userFormController.user!);

                    if (imageProvider.imagePath != '') {
                      await userProvider
                          .uploadImage(imageProvider.imagePath!, userId!)
                          .whenComplete(() async {
                        await userProvider.getUsers();
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, 'users');
                      });
                    } else {
                      await userProvider.getUsers();
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, 'users');
                    }
                  },
                ),
                _separador(height),
              ],
            ),
          ),
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
