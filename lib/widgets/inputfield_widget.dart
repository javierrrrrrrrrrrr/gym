import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    required this.width,
    required this.hinttext,
    Key? key,
  }) : super(key: key);
  final double width;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 20),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_circle,
                color: Color.fromRGBO(150, 152, 154, 0.5)),
          ),
        ),
      ),
    );
  }
}
