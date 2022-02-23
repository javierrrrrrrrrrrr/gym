import 'package:flutter/material.dart';
import 'package:gym/providers/users_provider.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddTrainer extends StatelessWidget {
  const AddTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(253, 254, 255, 1),
          child: Column(
            children: [
              BannerTop(height: height, width: width, title: "Crear Cliente"),
              SelectIMGWidget(width: width, height: height),
              SizedBox(
                height: height * 0.02,
              ),
              InputFieldWidget(
                keyboardType: TextInputType.text,
                onChanged: (value) {},
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
                onChanged: (value) => {},
                validator: (value) {
                  //TODO:Validator
                },
                keyboardType: TextInputType.text,
                width: width,
                hinttext: 'Apellidos',
              ),
              _separador(height),
              // InputFieldWidget(
              //   width: width,
              //   hinttext: 'email',
              // ),
              // _separador(height),
              // InputFieldWidget(
              //   width: width,
              //   hinttext: 'Contraseña',
              // ),
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
                color: const Color.fromRGBO(45, 49, 146, 1),
                onPressed: () {},
              ),
            ],
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
