import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';
import 'package:provider/provider.dart';

import '../providers/Users/user_form_controller.dart';

class BannerBlue extends StatelessWidget {
  const BannerBlue({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final userFormController = Provider.of<UserFormController>(
      context,
    );
    String datetime = user.datetime.toString().substring(0, 9);
    String year = datetime.substring(0, 4);
    String month = datetime.substring(5, 7);
    String day = datetime.substring(8, datetime.length);

    final width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 0.2291,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(77, 82, 233, 1),
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PrimaryText(text: "Miembro"),
                SecondaryText(
                  text: user.datetime!,
                )
              ],
            ),
            onTap: () async {
              await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 100),
                      lastDate: DateTime(DateTime.now().year + 1))
                  .then((value) {
                if (value != null) {
                  if (value.day > 10) {
                    user.datetime = "${value.day}/${value.month}/${value.year}";
                  } else {
                    user.datetime =
                        "0${value.day}/${value.month}/${value.year}";
                  }
                  userFormController.ChangeFecha(user.datetime.toString());
                }
              });
            },
          ),
          Container(
            width: 1,
            height: width * 0.2036,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.0381),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PrimaryText(text: "Estado"),
                SecondaryText(
                  active: user.active,
                  text: user.active == true ? "Active" : "Inactive",
                )
              ],
            ),
          ),
          Container(
            width: 1,
            height: width * 0.2036,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PrimaryText(text: "Vence"),
              SecondaryText(
                text: user.activeto.toString(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SecondaryText extends StatelessWidget {
  const SecondaryText({Key? key, required this.text, this.active})
      : super(key: key);
  final String text;
  final bool? active;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(text,
        style: TextStyle(
            fontSize: width * 0.0458,
            color: active != null
                ? active!
                    ? const Color.fromRGBO(75, 232, 119, 1)
                    : Colors.red
                : Colors.white));
  }
}

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(text,
        style: TextStyle(
          fontSize: width * 0.0458,
          color: const Color.fromRGBO(255, 255, 255, 0.6),
        ));
  }
}
