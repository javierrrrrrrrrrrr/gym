import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';
import 'package:gym/providers/payment_form_controller.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class Pagos extends StatelessWidget {
  const Pagos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UsersProvider>(context);
    final paymentProvider = Provider.of<PaymentFormController>(context);
    User user = userProvider.selectedUser!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerTop(title: "Anadir Pago"),
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
              onChanged: ((value) {
                paymentProvider.amount = value;
              }),
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
              onChanged: ((value) {
                paymentProvider.cantMeses = value;
              }),
              width: width,
              hinttext: 'Cantidad / Meses',
            ),
            const SizedBox(
              height: 15,
            ),
            InputFieldWidget(
              enabled: false,
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
              enabled: false,
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
              onChanged: ((value) {
                paymentProvider.comentario = value;
              }),
              width: width,
              hinttext: 'Comentario de Pago(s)',
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
                child: CustomButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });

                      await userProvider
                          .createPaymnet(
                              id: user.id,
                              amount: paymentProvider.amount,
                              comment: paymentProvider.comentario,
                              mounth: paymentProvider.cantMeses)
                          .whenComplete(() async {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, 'lista_pagos');
                      });
                    },
                    title: "Añadir Pago")),
          ],
        ),
      ),
    );
  }
}
