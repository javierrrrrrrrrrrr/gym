import 'package:flutter/material.dart';
import 'package:gym/widgets/inputfield_widget.dart';
import 'package:gym/widgets/select_img_widget.dart';
import 'package:gym/widgets/widgets.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

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
                width: width,
                hinttext: 'Nombre',
              ),
              _separador(height),
              InputFieldWidget(
                width: width,
                hinttext: 'Apellidos',
              ),
              _separador(height),
              InputFieldWidget(
                width: width,
                hinttext: 'Teléfono',
              ),
              _separador(height),
              InputFieldWidget(
                width: width,
                hinttext: 'Móvil',
              ),
              _separador(height),
              InputFieldWidget(
                width: width,
                hinttext: 'Edad',
              ),
              _separador(height),
              InputFieldWidget(
                width: width,
                hinttext: 'Estatura',
              ),
              _separador(height),
              InputFieldWidget(
                width: width,
                hinttext: 'Servicios',
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
