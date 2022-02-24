import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dropdown_plus/dropdown_plus.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

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
                BannerTop(height: height, width: width, title: "Crear Cliente"),
                SelectIMGWidget(width: width, height: height),
                SizedBox(
                  height: height * 0.02,
                ),
                InputFieldWidget(
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
                  obscureText: false,
                  onChanged: (value) => userFormController.lastname = value,
                  keyboardType: TextInputType.text,
                  width: width,
                  hinttext: 'Apellidos',
                ),
                _separador(height),
                InputFieldWidget(
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => userFormController.phone = value,
                  width: width,
                  hinttext: 'Teléfono',
                ),
                _separador(height),
                InputFieldWidget(
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
                  child: TextDropdownFormField(
                    onSaved: (value) {
                      userFormController.services = value!;
                    },
                    options: const ["TRAINING", "AEROBICS", "MASSAGE"],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(45, 49, 146, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        labelText: "Services"),
                    dropdownHeight: 200,
                  ),
                ),

                const SizedBox(
                  height: 100,
                ),
                MaterialButton(
                  onPressed: () {
                    final userProvider =
                        Provider.of<UsersProvider>(context, listen: false);

                    userProvider.createUser(
                        userFormController.firstname,
                        userFormController.lastname,
                        int.parse(userFormController.age),
                        userFormController.height,
                        userFormController.weight,
                        userFormController.email,
                        userFormController.phone,
                        userFormController.imc,
                        userFormController.icc,
                        userFormController.services);

                    Navigator.pushNamed(context, 'users');
                  },
                  height: 60,
                  minWidth: 240,
                  color: const Color.fromRGBO(45, 49, 146, 1),
                  child: const Text(
                    'Agregar',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
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
