import 'package:flutter/material.dart';

import '../../helpers/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/edti_user_img.dart';
import '../../widgets/inputfield_widget.dart';

class EditTrainer extends StatefulWidget {
  const EditTrainer({Key? key}) : super(key: key);

  @override
  State<EditTrainer> createState() => _EditTrainerState();
}

class _EditTrainerState extends State<EditTrainer> {
  bool _validateName = false;
  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, width: width, title: "Editar Cliente"),
      body: Column(
        children: [
          // const EditUserImg(),
          InputFieldWidget(
            maxLength: 15,
            label: const Text('Nombre'),
            validateIcon: _validateName,
            icon: true,
            maxline: 1,
            right: 25,
            left: 25,
            initialvalue: '', //userFormController.user!.firstname,
            obscureText: false,
            keyboardType: TextInputType.text,
            onChanged: ((value) {
              // userFormController.user!.firstname = value;
              setState(() {
                if (value.isEmpty) {
                  _validateName = false;
                } else {
                  _validateName = true;
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
          InputFieldWidget(
            maxLength: 40,
            validateIcon: _validateEmail,
            label: const Text('Email'),
            icon: true,
            maxline: 1,
            right: 25,
            left: 25,
            initialvalue: '', //user.email ?? '',
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              // userFormController.user!.email = value;
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
          InputFieldWidget(
              validateIcon: _validatePassword,
              icon: true,
              maxline: 1,
              right: 25,
              left: 25,
              initialvalue: "",
              obscureText: true,
              width: width,
              label: const Text('Entrar Password'),
              onChanged: (value) {
                // loginController.password = value;

                setState(() {
                  if ((value != null && value.length > 5)) {
                    _validatePassword = true;
                  } else {
                    _validatePassword = false;
                  }
                });
              },
              validator: (value) {
                if ((value != null && value.length > 5)) {
                  // controlcontrsena = true;
                  //  loginController.setisvalidPassw = true;
                  return null;
                } else {
                  // controlcontrsena = false;
                  return "La contrasena debe tener 6 caracteres";
                }
              },
              keyboardType: TextInputType.emailAddress),

          _separador(width),

          CustomButton(
              color: const Color.fromRGBO(45, 49, 146, 1),
              onPressed: () async {},
              title: "Guardar"),
          _separador(width * 0.6),
          CustomButton(
              color: Colors.black, onPressed: () async {}, title: "Eliminar"),
        ],
      ),
    );
  }

  SizedBox _separador(double width) {
    return SizedBox(
      height: width * 0.1,
    );
  }
}
