import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EditUserImg extends StatefulWidget {
  const EditUserImg({Key? key}) : super(key: key);

  @override
  State<EditUserImg> createState() => _EditUserImgState();
}

class _EditUserImgState extends State<EditUserImg> {
  @override
  void initState() {
    super.initState();
    final imageProvider = Provider.of<SelectImg>(context, listen: false);
    imageProvider.imagePath = "";
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final imageProvider = Provider.of<SelectImg>(context);
    final usersProvider = Provider.of<UsersProvider>(context);
    User user = usersProvider.selectedUser!;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.035),
      child: Container(
          color: const Color.fromRGBO(253, 254, 255, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  imageProvider.imagePath == ""
                      ? UserImgFromApi(
                          imageProvider: imageProvider,
                          height: height,
                          width: width,
                          user: user)
                      : PikedImg(
                          height: height,
                          width: width,
                          imageProvider: imageProvider),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: BannerBlue(user: user),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class PikedImg extends StatelessWidget {
  const PikedImg({
    Key? key,
    required this.height,
    required this.width,
    required this.imageProvider,
  }) : super(key: key);

  final double height;
  final double width;
  final SelectImg imageProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height * 0.18,
          width: width * 0.40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(width * 0.025),
            child: Image.file(
              imageProvider.img!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            imageProvider.cropFile();
          },
          child: Container(
            color: Colors.white,
            height: width * 0.115,
            width: width * 0.115,
            child: const Icon(
              Icons.photo_size_select_large_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class UserImgFromApi extends StatelessWidget {
  const UserImgFromApi({
    Key? key,
    required this.imageProvider,
    required this.height,
    required this.width,
    required this.user,
  }) : super(key: key);

  final SelectImg imageProvider;
  final double height;
  final double width;
  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          imageProvider.isTouch = true;
          imageProvider.pikeImage();
        } on Exception {
          // TODO
        }
      },
      child: ImgUserContainer(user: user),
    );
  }
}

class BannerBlue extends StatelessWidget {
  const BannerBlue({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    String datetime = user.datetime.toString().substring(0, 9);
    String year = datetime.substring(0, 4);
    String month = datetime.substring(5, 7);
    String day = datetime.substring(8, datetime.length);

    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 90,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(77, 82, 233, 1),
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PrimaryText(text: "Miembro"),
              SecondaryText(
                text: "$day/$month/$year",
              )
            ],
          ),
          Container(
            width: 2,
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
            width: 2,
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
