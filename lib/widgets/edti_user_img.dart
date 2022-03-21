import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/banner_blue.dart';
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
      child: ImgUserContainer(
        user: user,
        height: width * 0.2902,
        width: width * 0.3208,
      ),
    );
  }
}
