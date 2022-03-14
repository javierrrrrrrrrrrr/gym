import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';
import 'package:gym/models/models.dart';
import 'package:gym/providers/Users/payment_form_controller.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class Pagos extends StatefulWidget {
  const Pagos({Key? key}) : super(key: key);

  @override
  State<Pagos> createState() => _PagosState();
}

int cantidadPago = 0;
int cantidadMeses = 0;
double total = 0;

class _PagosState extends State<Pagos> {
  @override
  void initState() {
    total = 0;
    cantidadPago = 0;
    cantidadMeses = 0;
    super.initState();
  }

  String CalcularXmes() {
    total = 0;
    setState(() {
      total = cantidadPago / cantidadMeses;
    });
    return '$total';
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UsersProvider>(context);
    final paymentProvider = Provider.of<PaymentFormController>(context);
    User user = userProvider.selectedUser!;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      appBar: customAppbar(context, width: width, title: "Adicionar Pago"),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: paymentProvider.formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      keyboardType: TextInputType.number,
                      onChanged: ((value) {
                        if (value != null && value != '') {
                          try {
                            cantidadPago = int.parse(value);
                          } catch (e) {
                            value = '';
                          }
                        }
                        CalcularXmes();
                        paymentProvider.amount = value;
                      }),
                      width: width,
                      label: const Text('Cantidad total a pagar en CUP'),
                      validator: (value) {
                        String edadpattern = r'^([0-9])*$';
                        var cup = RegExp(edadpattern);

                        if (cup.hasMatch(value ?? "") &&
                            value != null &&
                            value != "" &&
                            value.length > 1) {
                          return null;
                        } else {
                          return "EL valor especificado debe ser un monto mayor que 1 :)";
                        }
                      },
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
                      label: const Text('Cantidad / Meses'),
                      right: 160,
                      left: 25,
                      initialvalue: '',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      onChanged: ((value) {
                        if (value != null && value != '') {
                          try {
                            cantidadMeses = int.parse(value);
                          } catch (e) {
                            value = '';
                          }
                          CalcularXmes();
                          paymentProvider.cantMeses = value;
                        }
                      }),
                      width: width,
                      validator: (value) {
                        String edadpattern = r'^([0-9])*$';
                        var cantMes = RegExp(edadpattern);

                        if (cantMes.hasMatch(value ?? "") &&
                            value != null &&
                            value != "" &&
                            value.isNotEmpty) {
                          return null;
                        } else {
                          return "EL valor especificado debe ser un monto mayor que 0 :)";
                        }
                      },
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
                      hinttext: CalcularXmes() + ' CUP por cada Mes ',
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
                              if (paymentProvider.isValidForm()) {
                                showDialog(
                                    barrierDismissible: false,
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
                                  Navigator.pop(context);
                                  // Navigator.pushReplacementNamed(context, 'lista_pagos');
                                });
                              }
                            },
                            title: "Añadir Pago")),
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
}
