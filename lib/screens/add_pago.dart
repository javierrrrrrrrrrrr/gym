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
              ico: false,
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
              ico: false,
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
              ico: false,
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
              ico: false,
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
              ico: false,
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
            Center(
              child: MaterialButton(
                onPressed: () {},
                height: 60,
                minWidth: 240,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                splashColor: Colors.transparent,
                color: const Color.fromRGBO(45, 49, 146, 1),
                child: const Text(
                  'Enviar Pago(s)',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
