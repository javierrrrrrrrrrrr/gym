import 'package:flutter/material.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:provider/provider.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _validateEmail = false;
  bool _validatePassword = false;
  bool valor = false;

  @override
  void initState() {
    final loginProvaider = Provider.of<LoginProvider>(context, listen: false);
    valor = loginProvaider.recordarContrasena;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginFormController>(context);
    final loginProvaider = Provider.of<LoginProvider>(context);

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
                        validateIcon: loginProvaider.recordarContrasena
                            ? !_validateEmail
                            : _validateEmail,
                        icon: true,
                        maxline: 1,
                        right: width * 0.02,
                        left: width * 0.02,
                        initialvalue: loginProvaider.recordarContrasena
                            ? loginProvaider.usuarioGuardado.toString()
                            : "",
                        obscureText: false,
                        width: width,
                        label: const Text('Entrar Email'),
                        onChanged: (value) {
                          loginController.email = value;

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
                          validateIcon: loginProvaider.recordarContrasena
                              ? !_validatePassword
                              : _validatePassword,
                          icon: true,
                          maxline: 1,
                          right: width * 0.02,
                          left: width * 0.02,
                          initialvalue: loginProvaider.recordarContrasena
                              ? loginProvaider.contrsenaGuardada.toString()
                              : "",
                          obscureText: true,
                          width: width,
                          label: const Text('Entrar Password'),
                          onChanged: (value) {
                            loginController.password = value;

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
                      Padding(
                        padding: const EdgeInsets.only(right: 140),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: const Color.fromRGBO(77, 82, 233, 1),
                              value: valor,
                              onChanged: (value) {
                                setState(() {
                                  valor = value!;
                                });
                              },
                            ),
                            const Text(
                              "Recordar contraseña",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                            ),
                          ],
                        ),
                      ),
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
        decoration: _boxDecoration(width),
        child: Center(
          child: Text(
            "Acceder",
            style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 0.8),
                fontSize: width * 0.065),
          ),
        ),
        height: height * 0.055,
        width: width * 0.65,
      ),
      onTap: () async {
        String? resp = '';
        if (loginController.isValidForm()) {
          final loginProvider =
              Provider.of<LoginProvider>(context, listen: false);

          FocusScope.of(context).unfocus();

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });

          try {
            if (loginProvider.recordarContrasena == true) {
              resp = await loginProvider.loginUser(
                  loginProvider.usuarioGuardado,
                  loginProvider.contrsenaGuardada,
                  valor);
            } else {
              resp = await loginProvider.loginUser(
                  loginController.email, loginController.password, valor);
            }

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
        }
      },
    );
  }

  BoxDecoration _boxDecoration(var width) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(width * 0.025),
      color: const Color.fromRGBO(77, 82, 233, 1),
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
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.0025))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1))),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black54, fontSize: width * 0.065),
      suffixIcon: const Icon(Icons.check_circle,
          color: Color.fromRGBO(150, 152, 154, 0.5)),
    );
  }
}
