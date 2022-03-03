import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class Pagos extends StatelessWidget {
  const Pagos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerTop(height: height, width: width, title: "Anadir Pago"),
            EditUserImg(width: width, height: height),
            const SizedBox(
              height: 25,
            ),
            InputFieldWidget(
              icon: false,
              maxline: 1,
              right: 30,
              left: 25,
              initialvalue: '',
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: ((value) {}),
              width: width,
              hinttext: 'Cantidad CUP',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 15),
              child: Text(
                'Meses :',
                textScaleFactor: 1.2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InputFieldWidget(
              icon: false,
              maxline: 1,
              right: 160,
              left: 25,
              initialvalue: '',
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: ((value) {}),
              width: width,
              hinttext: 'Cantidad / Meses',
            ),
            const SizedBox(
              height: 15,
            ),
            InputFieldWidget(
              icon: false,
              maxline: 1,
              right: 30,
              left: 25,
              initialvalue: '',
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: ((value) {}),
              width: width,
              hinttext: 'Cantidad / Mes',
            ),
            const SizedBox(
              height: 15,
            ),
            InputFieldWidget(
              icon: false,
              maxline: 1,
              right: 30,
              left: 25,
              initialvalue: '',
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: ((value) {}),
              width: width,
              hinttext: 'Descuento %',
            ),
            const SizedBox(
              height: 15,
            ),
            InputFieldWidget(
              icon: false,
              maxline: 5,
              right: 30,
              left: 25,
              initialvalue: '',
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: ((value) {}),
              width: width,
              hinttext: 'Comentario de Pago(s)',
            ),
            const SizedBox(
              height: 15,
            ),
            Center(child: CustomButton(onPressed: () {}, title: "Añadir Pago")),
          ],
        ),
      ),
    );
  }
}