import 'package:flutter/material.dart';
import 'package:gym/widgets/custom_banner_top.dart';
import 'package:gym/widgets/inputfield_widget.dart';
import 'package:gym/widgets/select_img_widget.dart';

class Observ extends StatelessWidget {
  const Observ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerTop(
              title: "Añadir Observación",
              height: height,
              width: width,
            ),
            SelectIMGWidget(
              width: width,
              height: height,
            ),
            const SizedBox(
              height: 20,
            ),
            InputFieldWidget(
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
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
