import 'package:flutter/material.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:provider/provider.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginFormController>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: height * 0.04),
                height: height * 0.5,
                width: width,
                child: const Image(
                  image: AssetImage('assets/gym.jpeg'),
                )),
            SizedBox(
              height: height * 0.12,
              width: width * 0.45,
              child: const Text(
                'Acceder al panel de Administracion del Gimnasio',
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(
              width: width * 0.8,
              child: Form(
                  key: loginController.formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      InputFieldWidget(
                        icon: true,
                        maxline: 1,
                        right: 18,
                        left: 15,
                        initialvalue: "",
                        obscureText: false,
                        width: width,
                        hinttext: 'Enter Email',
                        onChanged: (value) {
                          loginController.email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
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
                      SizedBox(
                        height: height * 0.01,
                      ),
                      InputFieldWidget(
                          icon: true,
                          maxline: 1,
                          right: 18,
                          left: 15,
                          initialvalue: "",
                          obscureText: true,
                          width: width,
                          hinttext: 'Enter Password',
                          onChanged: (value) {
                            loginController.password = value;
                          },
                          validator: (value) {
                            if ((value != null && value.length > 5)) {
                              // controlcontrsena = true;

                              return null;
                            } else {
                              // controlcontrsena = false;
                              return "La contrasena debe tener 6 caracteres";
                            }
                          },
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      _button(height, width, context, loginController),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _button(double height, double width, BuildContext context,
      LoginFormController loginController) {
    return GestureDetector(
      child: Container(
        decoration: _boxDecoration(),
        child: const Center(
          child: Text(
            "Acceder",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8), fontSize: 22),
          ),
        ),
        height: height * 0.055,
        width: width * 0.65,
      ),
      onTap: () async {
        final loginProvider =
            Provider.of<LoginProvider>(context, listen: false);

        FocusScope.of(context).unfocus();

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });

        try {
          String? resp = await loginProvider.loginUser(
              loginController.email, loginController.password);

          if (resp == '') {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, 'admin');
          } else {
            Navigator.pop(context);
            ElegantNotification.error(
              toastDuration: const Duration(milliseconds: 4000),
              animation: ANIMATION.fromTop,
              title: const Text('Error'),
              description: const Text('Por favor verifica los datos'),
            ).show(context);
          }
        } catch (e) {
          Navigator.pop(context);
          ElegantNotification.error(
            toastDuration: const Duration(milliseconds: 4000),
            animation: ANIMATION.fromTop,
            title: const Text('Error'),
            description: const Text('Problemas de conexion'),
          ).show(context);
        }
      },
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(8),
      color: const Color.fromRGBO(45, 49, 146, 1),
    );
  }

  TextFormField textFormField(
    double width,
    String hintText,
    void Function(String)? onChange,
    String? Function(String?)? validator,
    bool value,
  ) {
    return TextFormField(
      obscureText: value,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChange,
      validator: validator,
      decoration: _inputDecoration(width, hintText),
    );
  }

  InputDecoration _inputDecoration(double width, String hintText) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.035),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1))),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 20),
      suffixIcon: const Icon(Icons.check_circle,
          color: Color.fromRGBO(150, 152, 154, 0.5)),
    );
  }
}
