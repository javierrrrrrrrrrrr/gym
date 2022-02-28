import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    Key? key,
    required this.width,
    required this.hinttext,
    this.validator,
    required this.onChanged,
    required this.keyboardType,
    required this.obscureText,
    required this.initialvalue,
  }) : super(key: key);
  final double width;
  final String hinttext;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String initialvalue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 55),
      child: TextFormField(
        initialValue: initialvalue,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        decoration: inputDecoration(hinttext),
      ),
    );
  }
}

InputDecoration inputDecoration(hinttext) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
  );
}
