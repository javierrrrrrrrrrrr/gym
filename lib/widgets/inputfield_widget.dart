import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {Key? key,
      required this.icon,
      required this.maxline,
      required this.left,
      required this.right,
      required this.width,
      this.hinttext,
      this.validator,
      required this.onChanged,
      required this.keyboardType,
      required this.obscureText,
      this.initialvalue,
      this.enabled,
      this.label,
      this.counter,
      this.validateIcon,
      this.maxLength})
      : super(key: key);
  final double width;
  final String? hinttext;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialvalue;
  final double left;
  final double right;
  final int maxline;
  final bool icon;
  final bool? enabled;
  final Widget? label;
  final Widget? counter;
  final bool? validateIcon;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: TextFormField(
        maxLength: maxLength,
        enabled: (enabled == null) ? true : enabled,
        maxLines: maxline,
        initialValue: initialvalue,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        decoration: inputDecoration(
            hinttext, icon, label, counter, validateIcon, width),
      ),
    );
  }
}

InputDecoration inputDecoration(hinttext, bool hasicon, Widget? label,
    Widget? counter, bool? validateIcon, var width) {
  if (hasicon == true) {
    return InputDecoration(
      counter: counter,
      label: label,
      contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: width * 0.025),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(77, 82, 233, 1)),
          borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
      hintText: hinttext,
      hintStyle: TextStyle(color: Colors.black54, fontSize: width * 0.05),
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(Icons.check_circle,
            color: (validateIcon == true)
                ? Colors.green
                : const Color.fromRGBO(150, 152, 154, 0.5)),
      ),
    );
  } else {
    return InputDecoration(
      label: label,
      contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: width * 0.025),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(77, 82, 233, 1)),
          borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
      hintText: hinttext,
      hintStyle: TextStyle(color: Colors.black54, fontSize: width * 0.05),
    );
  }
}
