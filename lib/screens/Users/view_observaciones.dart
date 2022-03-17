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
    print(index);
    return Scaffold(
      appBar: customAppbar(context, width: width, title: "Observacion"),
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(
                    height: 25,
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
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 95,
                        child: textFormFieldChiquito(
                            keyboardType: TextInputType.number,
                            text: "Peso",
                            initialvalue: userProvider.observation[index].weight
                                .toString(),
                            onChanged: (value) {}),
                      ),
                      SizedBox(
                        width: 95,
                        child: textFormFieldChiquito(
                            keyboardType: TextInputType.number,
                            text: "IMC",
                            initialvalue:
                                userProvider.observation[index].imc.toString(),
                            onChanged: (value) {}),
                      ),
                      SizedBox(
                        width: 95,
                        child: textFormFieldChiquito(
                            keyboardType: TextInputType.number,
                            initialvalue:
                                userProvider.observation[index].icc.toString(),
                            text: "ICC",
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
      {required String text,
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
            )),
      ],
    );
  }

  InputDecoration _inputDecoration(
    String text,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 10, right: 35),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      hintText: text,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
    );
  }
}
