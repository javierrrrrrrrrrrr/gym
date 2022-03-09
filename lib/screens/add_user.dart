import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';

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

  var items = ["TRAINING", "AEROBICS", "MASSAGE"];
  String initialDropDownValue = "TRAINING";

  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateEmail = false;
  bool _validateAge = false;
  bool _validateHeight = false;
  bool _validateWeight = false;
  bool _validatePhone = false;
  bool _validateImc = false;
  bool _validateIcc = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userFormController = Provider.of<UserFormController>(context);
    return Scaffold(
      appBar: customAppbar(context, width: width, title: "Crear Cliente"),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(253, 254, 255, 1),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              children: [
                SelectIMGWidget(width: width, height: height),
                SizedBox(
                  height: height * 0.02,
                ),
                InputFieldWidget(
                  maxLength: 15,
                  validateIcon: _validateFirstName,
                  label: const Text('Nombre'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  onChanged: ((value) {
                    userFormController.user!.firstname = value;

                    setState(() {
                      if (value.isEmpty) {
                        _validateFirstName = false;
                      } else {
                        _validateFirstName = true;
                      }
                    });
                  }),
                  validator: (value) {
                    if (value!.isNotEmpty && value != "") {
                      return null;
                    } else {
                      return "El nombre debe tener al menos un caracter :)";
                    }
                  },
                  width: width,
                ),
                _separador(height),
                InputFieldWidget(
                  maxLength: 15,
                  validateIcon: _validateLastName,
                  label: const Text('Apellidos'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  obscureText: false,
                  onChanged: (value) {
                    userFormController.user!.lastname = value;
                    setState(() {
                      if (value.isEmpty) {
                        _validateLastName = false;
                      } else {
                        _validateLastName = true;
                      }
                    });
                  },
                  keyboardType: TextInputType.text,
                  width: width,
                  validator: (value) {
                    if (value!.isNotEmpty && value != "" || value == "") {
                      return null;
                    } else {
                      return "El apellido debe tener al menos un caracter :)";
                    }
                  },
                ),
                _separador(height),
                InputFieldWidget(
                  maxLength: 10,
                  validateIcon: _validatePhone,
                  label: const Text('Telefono'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    userFormController.user!.phone = value;
                    setState(() {
                      if (value.length > 5) {
                        _validatePhone = true;
                      } else {
                        _validatePhone = false;
                      }
                    });
                  },
                  width: width,
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
                  maxLength: 40,
                  validateIcon: _validateEmail,
                  label: const Text('Email'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    userFormController.user!.email = value;
                    setState(() {
                      String gmailpatter =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = RegExp(gmailpatter);
                      if (regExp.hasMatch(value)) {
                        _validateEmail = true;
                      } else {
                        _validateEmail = false;
                      }
                    });
                  },
                  width: width,
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
                  maxLength: 2,
                  validateIcon: _validateAge,
                  label: const Text('Edad'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userFormController.user!.age = int.parse(value);
                    setState(() {
                      String edadpattern = r'^([0-9])*$';
                      var edad = RegExp(edadpattern);

                      if (edad.hasMatch(value)) {
                        _validateAge = true;
                      }
                      if (value.isEmpty) {
                        _validateAge = false;
                      }
                    });
                  },
                  width: width,
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
                  maxLength: 3,
                  validateIcon: _validateHeight,
                  label: const Text('Estatura'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userFormController.user!.height = value;
                    var edad = RegExp(r'^([0-9])*$');
                    setState(() {
                      if (edad.hasMatch(value) && value.length < 4) {
                        _validateHeight = true;
                      } else {
                        _validateHeight = false;
                      }
                    });
                  },
                  width: width,
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
                  maxLength: 3,
                  validateIcon: _validateWeight,
                  label: const Text('Peso'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userFormController.user!.weight = value;
                    setState(() {
                      var edad = RegExp(r'^([0-9])*$');

                      if (edad.hasMatch(value) && value.length < 4) {
                        _validateWeight = true;
                      } else {
                        _validateWeight = false;
                      }
                    });
                  },
                  width: width,
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
                  maxLength: 3,
                  validateIcon: _validateImc,
                  label: const Text('Imc'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userFormController.user!.imc = value;
                    setState(() {
                      var edad = RegExp(r'^([0-9])*$');

                      if (edad.hasMatch(value) && value.length < 3) {
                        _validateImc = true;
                      } else {
                        _validateImc = false;
                      }
                    });
                  },
                  width: width,
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
                  maxLength: 3,
                  validateIcon: _validateIcc,
                  label: const Text('Icc'),
                  icon: true,
                  maxline: 1,
                  right: 25,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userFormController.user!.icc = value;
                    setState(() {
                      var edad = RegExp(r'^([0-9])*$');

                      if (edad.hasMatch(value) && value.length < 3) {
                        _validateIcc = true;
                      } else {
                        _validateIcc = false;
                      }
                    });
                  },
                  width: width,
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DropdownButtonFormField(
                      hint: Text("Services"),
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(45, 49, 146, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 20),
                      ),
                      // value: initialDropDownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          initialDropDownValue = value!;
                          if (value == "TRAINING") {
                            userFormController.user!.services.add("TRAINING");
                          } else {
                            userFormController.user!.services
                                .remove("TRAINING");
                          }

                          //
                          if (value == "AEROBICS") {
                            userFormController.user!.services.add("AEROBICS");
                          } else {
                            userFormController.user!.services
                                .remove("AEROBICS");
                          }

                          //
                          if (value == "MASSAGE") {
                            userFormController.user!.services.add("MASSAGE");
                          } else {
                            userFormController.user!.services.remove("MASSAGE");
                          }
                        });
                      }),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 28),
                //   child: Container(
                //     margin: const EdgeInsets.only(right: 25),
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.teal),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: CheckboxListTile(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       title: const Text("TRAINING"),
                //       value: userFormController.training,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           userFormController.training = value;
                //           if (userFormController.training == true) {
                //             userFormController.user!.services.add("TRAINING");
                //           } else {
                //             userFormController.user!.services
                //                 .remove("TRAINING");
                //           }
                //         });
                //       },
                //     ),
                //   ),
                // ),
                // _separador(height),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 28),
                //   child: Container(
                //     margin: const EdgeInsets.only(right: 25),
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.teal),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: CheckboxListTile(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       title: const Text("AEROBICS"),
                //       value: userFormController.aerobics,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           userFormController.aerobics = value;
                //           if (userFormController.aerobics == true) {
                //             userFormController.user!.services.add("AEROBICS");
                //           } else {
                //             userFormController.user!.services
                //                 .remove("AEROBICS");
                //           }
                //         });
                //       },
                //     ),
                //   ),
                // ),
                // _separador(height),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 28),
                //   child: Container(
                //     margin: const EdgeInsets.only(right: 25),
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.teal),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: CheckboxListTile(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       title: const Text("MASSAGE"),
                //       value: userFormController.massage,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           userFormController.massage = value;
                //           if (userFormController.massage == true) {
                //             userFormController.user!.services.add("MASSAGE");
                //           } else {
                //             userFormController.user!.services.remove("MASSAGE");
                //           }
                //         });
                //       },
                //     ),
                //   ),
                // ),

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
      height: height * 0.005,
    );
  }

  buidMenuItem(String item) => DropdownMenuItem(value: item, child: Text(item));
}
