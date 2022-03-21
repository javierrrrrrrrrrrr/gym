import 'package:flutter/material.dart';
import 'package:gym/models/Users/getUsersModel.dart';

class ImgUserContainer extends StatelessWidget {
  const ImgUserContainer({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.18,
      width: width * 0.40,
      child: (user.img != "no-avatar.png")
          ? Hero(
              tag: user.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.025),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images.jpg'),
                  image: NetworkImage(
                      'http://181.225.253.122:3000/api/uploads/clients/${user.id}'),
                  placeholderFit: BoxFit.cover,
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images.jpg'),
                      fit: BoxFit.cover)),
            ),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(196, 196, 196, 1),
          borderRadius: BorderRadius.circular(width * 0.025)),
    );
  }
}
