import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class Observ extends StatefulWidget {
  const Observ({Key? key}) : super(key: key);

  @override
  State<Observ> createState() => _ObservState();
}

class _ObservState extends State<Observ> {
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
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: SingleChildScrollView(
        child: Form(
          key: obervableController.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const BannerTop(
                title: "Añadir Observación",
              ),
              const EditUserImg(),
              const SizedBox(
                height: 20,
              ),
              InputFieldWidget(
                enabled: false,
                icon: true,
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
                        text: "Peso",
                        validator: (value) {
                          String edadpattern = r'^([0-9])*$';
                          var peso = RegExp(edadpattern);

                          if (peso.hasMatch(value ?? "") &&
                                  value != null &&
                                  value.length > 1 &&
                                  value != "" ||
                              value == "") {
                            return null;
                          } else {
                            return "Error";
                          }
                        },
                        onChanged: (value) {
                          obervableController.peso = value;
                        }),
                  ),
                  SizedBox(
                    width: 95,
                    child: textFormFieldChiquito(
                        text: "IMC",
                        validator: (value) {
                          String edadpattern = r'^([0-9])*$';
                          var imc = RegExp(edadpattern);

                          if (imc.hasMatch(value ?? "") &&
                                  value != null &&
                                  value.length > 1 &&
                                  value != "" ||
                              value == "") {
                            return null;
                          } else {
                            return "Error";
                          }
                        },
                        onChanged: (value) {
                          obervableController.imc = value;
                        }),
                  ),
                  SizedBox(
                    width: 95,
                    child: textFormFieldChiquito(
                        validator: (value) {
                          String edadpattern = r'^([0-9])*$';
                          var icc = RegExp(edadpattern);

                          if (icc.hasMatch(value ?? "") &&
                                  value != null &&
                                  value.length > 1 &&
                                  value != "" ||
                              value == "") {
                            return null;
                          } else {
                            return "Error";
                          }
                        },
                        text: "ICC",
                        onChanged: (value) {
                          obervableController.icc = value;
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
    );
  }

  Stack textFormFieldChiquito(
      {required String text,
      String? initialvalue,
      Function(String)? onChanged,
      String? Function(String?)? validator}) {
    return Stack(
      children: [
        TextFormField(
            validator: validator,
            onChanged: onChanged,
            initialValue: initialvalue,
            decoration: _inputDecoration(text)),
        const Positioned(
            right: 5,
            top: 12,
            child: Icon(Icons.check_circle,
                color: Color.fromRGBO(150, 152, 154, 0.5)))
      ],
    );
  }

  InputDecoration _inputDecoration(String text) {
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
