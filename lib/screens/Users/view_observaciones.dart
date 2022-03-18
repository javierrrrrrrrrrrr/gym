import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class ViewObservaciones extends StatefulWidget {
  const ViewObservaciones({Key? key}) : super(key: key);

  @override
  State<ViewObservaciones> createState() => _ObservState();
}

class _ObservState extends State<ViewObservaciones> {
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

    final int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: customAppbar(context, width: width, title: "Observacion"),
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: width * 0.6875),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: width * 0.05,
                  ),
                  InputFieldWidget(
                    enabled: false,
                    icon: false,
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
                  SizedBox(
                    height: width * 0.06365,
                  ),
                  InputFieldWidget(
                    icon: false,
                    maxline: 10,
                    right: 55,
                    left: 25,
                    initialvalue: userProvider.observation[index].observation,
                    obscureText: false,
                    width: width,
                    keyboardType: TextInputType.name,
                    hinttext: "Comentario de la Observacion",
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.2419,
                        child: textFormFieldChiquito(
                            width: width,
                            keyboardType: TextInputType.number,
                            text: "Peso",
                            initialvalue: userProvider.observation[index].weight
                                .toString(),
                            onChanged: (value) {}),
                      ),
                      SizedBox(
                        width: width * 0.2419,
                        child: textFormFieldChiquito(
                            width: width,
                            keyboardType: TextInputType.number,
                            text: "IMC",
                            initialvalue:
                                userProvider.observation[index].imc.toString(),
                            onChanged: (value) {}),
                      ),
                      SizedBox(
                        width: width * 0.2419,
                        child: textFormFieldChiquito(
                            width: width,
                            keyboardType: TextInputType.number,
                            initialvalue:
                                userProvider.observation[index].icc.toString(),
                            text: "ICC",
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                ],
              ),
            ),
          ),
          const EditUserImg(),
        ],
      ),
    );
  }

  Stack textFormFieldChiquito(
      {required double width,
      required String text,
      required final TextInputType? keyboardType,
      bool? validateIcon,
      String? initialvalue,
      Function(String)? onChanged,
      String? Function(String?)? validator}) {
    return Stack(
      children: [
        TextFormField(
            textAlign: TextAlign.center,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            initialValue: initialvalue,
            decoration: _inputDecoration(
              text,
              width,
            )),
      ],
    );
  }

  InputDecoration _inputDecoration(
    String text,
    double width,
  ) {
    return InputDecoration(
      contentPadding:
          EdgeInsets.only(left: width * 0.0254, right: width * 0.09),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.0254))),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
          borderRadius: BorderRadius.all(Radius.circular(width * 0.0254))),
      hintText: text,
      hintStyle: TextStyle(color: Colors.black54, fontSize: width * 0.04),
    );
  }
}
