import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class Observ extends StatefulWidget {
  const Observ({Key? key}) : super(key: key);

  @override
  State<Observ> createState() => _ObservState();
}

class _ObservState extends State<Observ> {
  bool _validateImc = false;
  bool _validateIcc = false;
  bool _validatePeso = false;

  @override
  void initState() {
    super.initState();
    final obervableController =
        Provider.of<ObservationFormController>(context, listen: false);

    obervableController.comment = '';
    obervableController.icc = '';
    obervableController.imc = '';
    obervableController.peso = '';
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UsersProvider>(context);
    final obervableController = Provider.of<ObservationFormController>(context);
    return Scaffold(
      appBar:
          customAppbar(context, width: width, title: "Adicionar Observacion"),
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: obervableController.formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InputFieldWidget(
                      enabled: false,
                      icon: false,
                      maxline: 1,
                      right: 55,
                      left: 25,
                      initialvalue: userProvider.selectedUser!.firstname,
                      obscureText: false,
                      width: width,
                      keyboardType: TextInputType.name,
                      hinttext: "",
                      onChanged: null,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InputFieldWidget(
                      icon: false,
                      maxline: 10,
                      right: 55,
                      left: 25,
                      initialvalue: "",
                      obscureText: false,
                      width: width,
                      keyboardType: TextInputType.name,
                      hinttext: "Comentario de la Observacion",
                      onChanged: (value) {
                        obervableController.comment = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 95,
                          child: textFormFieldChiquito(
                              keyboardType: TextInputType.number,
                              validateIcon: _validatePeso,
                              text: "Peso",
                              validator: (value) {
                                var edad = RegExp(r'^([0-9])*$');

                                if (edad.hasMatch(value!) && value.length < 4) {
                                  return null;
                                } else {
                                  return "error";
                                }
                              },
                              onChanged: (value) {
                                obervableController.peso = value;
                                setState(() {
                                  var edad = RegExp(r'^([0-9])*$');

                                  if (edad.hasMatch(value) &&
                                      value.length < 4) {
                                    _validatePeso = true;
                                  } else {
                                    _validatePeso = false;
                                  }
                                });
                              }),
                        ),
                        SizedBox(
                          width: 95,
                          child: textFormFieldChiquito(
                              keyboardType: TextInputType.number,
                              validateIcon: _validateImc,
                              text: "IMC",
                              validator: (value) {
                                var edad = RegExp(r'^([0-9])*$');

                                if (edad.hasMatch(value!) && value.length < 3) {
                                  return null;
                                } else {
                                  return "error";
                                }
                              },
                              onChanged: (value) {
                                obervableController.imc = value;
                                setState(() {
                                  var edad = RegExp(r'^([0-9])*$');

                                  if (edad.hasMatch(value) &&
                                      value.length < 3) {
                                    _validateImc = true;
                                  } else {
                                    _validateImc = false;
                                  }
                                });
                              }),
                        ),
                        SizedBox(
                          width: 95,
                          child: textFormFieldChiquito(
                              keyboardType: TextInputType.number,
                              validateIcon: _validateIcc,
                              validator: (value) {
                                var edad = RegExp(r'^([0-9])*$');

                                if (edad.hasMatch(value!) && value.length < 3) {
                                  return null;
                                } else {
                                  return "error";
                                }
                              },
                              text: "ICC",
                              onChanged: (value) {
                                obervableController.icc = value;
                                setState(() {
                                  var edad = RegExp(r'^([0-9])*$');

                                  if (edad.hasMatch(value) &&
                                      value.length < 3) {
                                    _validateIcc = true;
                                  } else {
                                    _validateIcc = false;
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        title: "Guardar",
                        onPressed: () async {
                          if (obervableController.isValidForm()) {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            await userProvider
                                .createObservation(
                              icc: obervableController.icc,
                              idUser: userProvider.selectedUser!.id,
                              imc: obervableController.imc,
                              observations: obervableController.comment,
                              weight: obervableController.peso,
                            )
                                .whenComplete(() {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              // Navigator.pushReplacementNamed(context, 'lista_obs');
                            });
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
          const EditUserImg(),
        ],
      ),
    );
  }

  Stack textFormFieldChiquito(
      {required String text,
      required final TextInputType? keyboardType,
      required bool validateIcon,
      String? initialvalue,
      Function(String)? onChanged,
      String? Function(String?)? validator}) {
    return Stack(
      children: [
        TextFormField(
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            initialValue: initialvalue,
            decoration: _inputDecoration(
              text,
            )),
        Positioned(
            right: 5,
            top: 12,
            child: Icon(Icons.check_circle,
                color: (validateIcon == true)
                    ? Colors.green
                    : const Color.fromARGB(255, 150, 152, 154)))
      ],
    );
  }

  InputDecoration _inputDecoration(
    String text,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 10, right: 35),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      hintText: text,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
    );
  }
}
