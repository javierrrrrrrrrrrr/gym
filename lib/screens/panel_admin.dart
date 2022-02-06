import 'package:flutter/material.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.08),
            height: height * 0.07,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: const Color.fromRGBO(45, 49, 146, 1),
            ),
            child: const Center(
              child: Text(
                'Panel de Administracion',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                textScaleFactor: 1.85,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(45, 49, 146, 1),
                ),
                margin: EdgeInsets.only(left: width * 0.05),
                height: height * 0.3,
                width: width * 0.4,
              ),
              SizedBox(
                width: width * 0.1,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(45, 49, 146, 1),
                ),
                height: height * 0.3,
                width: width * 0.4,
              ),
              SizedBox(
                height: height * 0.45,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(45, 49, 146, 1),
                ),
                margin: EdgeInsets.only(left: width * 0.05),
                height: height * 0.3,
                width: width * 0.4,
              ),
              SizedBox(
                width: width * 0.1,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(45, 49, 146, 1),
                ),
                height: height * 0.3,
                width: width * 0.4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
