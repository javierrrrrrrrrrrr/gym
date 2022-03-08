import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      splashColor: Colors.transparent,
      height: width * 0.15,
      minWidth: width * 0.61,
      color: (color == null) ? const Color.fromRGBO(45, 49, 146, 1) : color,
      child: Text(
        title,
        style: TextStyle(fontSize: width * 0.05, color: Colors.white),
      ),
    );
  }
}
