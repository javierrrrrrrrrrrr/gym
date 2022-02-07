import 'package:flutter/material.dart';

class SelectIMGWidget extends StatelessWidget {
  const SelectIMGWidget({required this.width, required this.height, Key? key})
      : super(key: key);

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.25,
            width: width * 0.4,
            child: const Center(
                child: Text(
              'Seleccione la imagen',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(240, 240, 240, 1)),
            )),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(196, 196, 196, 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: width * 0.065,
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage('assets/gym.jpeg'),
                  fit: BoxFit.cover,
                  height: height * 0.18,
                ),
                const Text(
                  'Formulario de Inscripción',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
