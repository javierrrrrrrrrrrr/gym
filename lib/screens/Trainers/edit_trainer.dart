import 'package:flutter/material.dart';
import 'package:gym/models/Trainers/trainer_model.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/edit_trainer_img.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_appbar.dart';
import '../../widgets/custom_button.dart';

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
  void initState() {
    super.initState();

    final trainersFormController =
        Provider.of<TrainersFormController>(context, listen: false);

    if (trainersFormController.trainer!.name.isNotEmpty) {
      _validateName = true;
    }
    if (trainersFormController.trainer!.email.isNotEmpty) {
      _validateEmail = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final trainerFormController = Provider.of<TrainersFormController>(context);
    final trainerProvider = Provider.of<TrainerProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final imageProvider = Provider.of<SelectImg>(context);
    return Scaffold(
      appBar: customAppbar(context, width: width, title: "Editar Entrenador"),
      body: Stack(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 270),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Form(
                      key: trainerFormController.formkey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          InputFieldWidget(
                            maxLength: 15,
                            label: const Text('Nombre'),
                            validateIcon: _validateName,
                            icon: true,
                            maxline: 1,
                            right: 25,
                            left: 25,
                            initialvalue: trainerProvider.selectedTrainer!.name,
                            //userFormController.user!.firstname,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            onChanged: ((value) {
                              trainerFormController.trainer!.name = value;
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
                            initialvalue:
                                trainerProvider.selectedTrainer!.email,
                            //user.email ?? '',
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              trainerFormController.trainer!.email = value;
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
                              initialvalue: "12345678",
                              obscureText: false,
                              width: width,
                              label: const Text('Entrar Password'),
                              onChanged: (value) {
                                // loginController.password = value;
                                trainerFormController.password = value;
                                setState(() {
                                  // ignore: unnecessary_null_comparison
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
                          _separador(width * 2.5),
                          CustomButton(
                              color: const Color.fromRGBO(45, 49, 146, 1),
                              onPressed: () async {
                                if (trainerFormController.isValidForm()) {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  trainerProvider.editTrainer(
                                      trainer: trainerFormController.trainer!,
                                      password: trainerFormController.password);
                                  if (imageProvider.isTouch == false) {
                                    //no se llama la peticion por que aprendimos a organizar la lista//
                                    //  await userProvider.getUsers();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  } else {
                                    imageProvider.isTouch = false;
                                    await trainerProvider.uploadImage(
                                        imageProvider.imagePath!,
                                        trainerProvider.selectedTrainer!.uid!);
                                    //Evaluar si se puede borrar de aqui el metodo de abajo :)
                                    //await userProvider.getUsers();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              title: "Guardar"),
                          _separador(width * 0.6),
                          CustomButton(
                              color: Colors.black,
                              onPressed: () async {
                                _showMyDialog(
                                    context, trainerFormController.trainer!);
                              },
                              title: "Eliminar"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const EditTrainerImg(),
            ],
          ),
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

Future<void> _showMyDialog(BuildContext context, Trainer trainer) async {
  final trainerProvider = Provider.of<TrainerProvider>(context, listen: false);
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Borrar Entrenador'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Esta accion borrara de forma permanente el entrenador del sistema',
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '¿ Desea Continuar ?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Si'),
            onPressed: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
              await trainerProvider.deleteTrainer(trainer);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
