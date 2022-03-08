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
        decoration:
            inputDecoration(hinttext, icon, label, counter, validateIcon),
      ),
    );
  }
}

InputDecoration inputDecoration(hinttext, bool hasicon, Widget? label,
    Widget? counter, bool? validateIcon) {
  if (hasicon == true) {
    return InputDecoration(
      counter: counter,
      label: label,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      hintText: hinttext,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 20),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(45, 49, 146, 1)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      hintText: hinttext,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 20),
    );
  }
}
