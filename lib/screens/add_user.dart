import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            // key: userFormController.formkey,
            child: Column(
              children: [
                BannerTop(height: height, width: width, title: "Crear Cliente"),
                SelectIMGWidget(width: width, height: height),
                SizedBox(
                  height: height * 0.02,
                ),
                InputFieldWidget(
                  keyboardType: TextInputType.text,
                  onChanged: ((value) {
                    userFormController.firstname = value;
                  }),
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
                  hinttext: 'Nombre',
                ),
                _separador(height),
                InputFieldWidget(
                  onChanged: (value) => userFormController.lastname = value,
                  keyboardType: TextInputType.text,
                  width: width,
                  hinttext: 'Apellidos',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => userFormController.phone = value,
                  width: width,
                  hinttext: 'Teléfono',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => userFormController.email = value,
                  width: width,
                  hinttext: 'Email',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.age = value,
                  width: width,
                  hinttext: 'Edad',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.height = value,
                  width: width,
                  hinttext: 'Estatura',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.weight = value,
                  width: width,
                  hinttext: 'Peso',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.imc = value,
                  width: width,
                  hinttext: 'Imc',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => userFormController.icc = value,
                  width: width,
                  hinttext: 'Icc',
                ),
                _separador(height),
                InputFieldWidget(
                  keyboardType: TextInputType.text,
                  onChanged: (value) => userFormController.services = value,
                  width: width,
                  hinttext: 'Servicios',
                ),
                _separador(height),
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
