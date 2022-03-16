import 'package:flutter/material.dart';
import 'package:gym/providers/Users/image_provider.dart';
import 'package:gym/providers/Users/users_provider.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_appbar.dart';
import '../../providers/Trainers/trainers_form_controller.dart';
import '../../providers/Trainers/trainers_provider.dart';

class AddTrainer extends StatefulWidget {
  const AddTrainer({Key? key}) : super(key: key);

  @override
  State<AddTrainer> createState() => _AddTrainerState();
}

bool _validatePassword = false;
bool _validateEmail = false;
bool _validNombre = false;

class _AddTrainerState extends State<AddTrainer> {
  @override
  void initState() {
    super.initState();
    final imageProvider = Provider.of<SelectImg>(context, listen: false);
    imageProvider.imagePath = "";
  }

  @override
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final trainerProvaider = Provider.of<TrainerProvider>(context);

    final trainerFormController = Provider.of<TrainersFormController>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(
        context,
        width: width,
        title: "GYM Fitness Model",
        actions: [
          IconButton(
            onPressed: () {
              //showSearch(context: context, delegate: UserSerch());
            },
            icon: Icon(
              Icons.search,
              color: const Color.fromRGBO(150, 152, 154, 0.5),
              size: width * 0.080,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(253, 254, 255, 1),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SelectIMGWidget(width: width, height: height),
                SizedBox(
                  height: height * 0.02,
                ),
                InputFieldWidget(
                  validateIcon: _validNombre,
                  icon: true,
                  maxline: 1,
                  right: 55,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    trainerFormController.trainer!.name = value;

                    setState(() {
                      if (value.isEmpty) {
                        _validNombre = false;
                      } else {
                        _validNombre = true;
                      }
                    });
                  },
                  validator: (value) {
                    if ((value != null && value.length > 3)) {
                      // controlcontrsena = true;

                      return null;
                    } else {
                      // controlcontrsena = false;
                      return "El nombre debe ser mayor de 3 caracteres";
                    }
                  },
                  width: width,
                  label: const Text('Nombre'),
                ),
                _separador(height),
                InputFieldWidget(
                  validateIcon: _validateEmail,
                  icon: true,
                  maxline: 1,
                  right: 55,
                  left: 25,
                  initialvalue: "",
                  obscureText: false,
                  width: width,
                  label: const Text(' Email'),
                  onChanged: (value) {
                    trainerFormController.trainer!.email = value;

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
                _separador(height),
                InputFieldWidget(
                    validateIcon: _validatePassword,
                    icon: true,
                    maxline: 1,
                    right: 55,
                    left: 25,
                    initialvalue: "",
                    obscureText: false,
                    width: width,
                    label: const Text('Password'),
                    onChanged: (value) {
                      trainerFormController.password = value;

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
                SizedBox(
                  height: height * 0.1,
                ),
                MaterialButton(
                  child: const Text(
                    'Crear',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  height: height * 0.06,
                  minWidth: width * 0.7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: const Color.fromRGBO(77, 82, 233, 1),
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

                      String uid = await trainerProvaider.addTrainer(
                          trainer: trainerFormController.trainer!,
                          password: trainerFormController.password!);

                      if (imageProvider.imagePath != '') {
                        await trainerProvaider
                            .uploadImage(imageProvider.imagePath!, uid)
                            .whenComplete(() async {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
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
