import 'package:flutter/material.dart';
import 'package:gym/models/Users/getUsersModel.dart';

class ImgUserContainer extends StatelessWidget {
  const ImgUserContainer({
    Key? key,
    required this.user,
    required this.height,
    required this.width,
  }) : super(key: key);
  final User user;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: (user.img != "no-avatar.png")
          ? Hero(
              tag: user.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
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
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
