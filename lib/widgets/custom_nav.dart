import 'package:flutter/material.dart';

class CustomNav extends StatelessWidget {
  const CustomNav(
      {Key? key,
      required this.height,
      required this.width,
      required this.titulo})
      : super(key: key);

  final double height;
  final double width;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(height * 0.015),
            bottomRight: Radius.circular(height * 0.015)),
        child: Container(
          color: const Color.fromRGBO(45, 49, 146, 1),
          height: height * 0.180,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                titulo,
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: '   Buscar Usuario',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(150, 152, 154, 0.5),
                      fontSize: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(150, 152, 154, 0.5),
                        size: 35,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
