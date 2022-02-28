import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Observ extends StatelessWidget {
  const Observ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerTop(
              title: "Añadir Observación",
              height: height,
              width: width,
            ),
            EditUserImg(
              width: width,
              height: height,
            ),
            const SizedBox(
              height: 20,
            ),
            InputFieldWidget(
              initialvalue: "",
              obscureText: false,
              width: width,
              keyboardType: TextInputType.name,
              hinttext: "",
              onChanged: null,
            ),
            Padding(
              padding: const EdgeInsets.all(26),
              child: TextFormField(
                maxLines: 10,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  hintText: 'Comentario de la observación',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 95,
                  child: textFormFieldChiquito("Peso"),
                ),
                SizedBox(
                  width: 95,
                  child: textFormFieldChiquito("IMC"),
                ),
                SizedBox(
                  width: 95,
                  child: textFormFieldChiquito("ICC"),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            MaterialButton(
              onPressed: () {},
              height: 60,
              minWidth: 240,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              splashColor: Colors.transparent,
              color: const Color.fromRGBO(45, 49, 146, 1),
              child: const Text(
                'Añadir',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack textFormFieldChiquito(String text) {
    return Stack(
      children: [
        TextFormField(decoration: _inputDecoration(text)),
        const Positioned(
            right: 5,
            top: 12,
            child: Icon(Icons.check_circle,
                color: Color.fromRGBO(150, 152, 154, 0.5)))
      ],
    );
  }

  InputDecoration _inputDecoration(String text) {
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
