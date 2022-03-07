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

  final _formKey = GlobalKey<FormState>();
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
            key: _formKey,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => userFormController.user!.phone = value,
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
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => userFormController.user!.email = value,
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
                  initialvalue: "",
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.height = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.weight = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.imc = value,
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
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.user!.icc = value,
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
                            userFormController.user!.services.add("TRAINING");
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
                            userFormController.user!.services.add("AEROBICS");
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
                            userFormController.user!.services.add("MASSAGE");
                          } else {
                            userFormController.user!.services.remove("MASSAGE");
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
                  title: "Crear",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
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
                          // await userProvider.getUsers();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      } else {
                        // await userProvider.getUsers();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
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
