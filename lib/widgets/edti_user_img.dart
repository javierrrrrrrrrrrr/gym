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
      padding: EdgeInsets.only(top: height * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageProvider.imagePath == ""
              ? GestureDetector(
                  onTap: () {
                    imageProvider.isTouch = true;
                    imageProvider.pikeImage();
                  },
                  child: ImgUserContainer(
                      child: Container(
                    height: height * 0.25,
                    width: width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.025),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: const AssetImage(
                            'assets/JovialMeagerBull-size_restricted.gif'),
                        image: NetworkImage((user.img != "no-avatar.png")
                            ? 'http://78.108.216.56:3000/api/uploads/clients/${user.id}'
                            : 'https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=612x612&w=0&h=f-9tPXlFXtz9vg_-WonCXKCdBuPUevOBkp3DQ-i0xqo='),
                        placeholderFit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        //color: const Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.circular(width * 0.025)),
                  )),
                )
              : Stack(
                  children: [
                    SizedBox(
                      height: height * 0.25,
                      width: width * 0.4,
                      child: Image.file(
                        imageProvider.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      //114
                      left: width * 0.29,
                      child: GestureDetector(
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
                    ),
                  ],
                ),
          SizedBox(
            width: width * 0.065,
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage('assets/gym.jpeg'),
                  fit: BoxFit.cover,
                  height: height * 0.18,
                ),
                Text(
                  'Formulario de Inscripción',
                  style: TextStyle(fontSize: width * 0.05, color: Colors.black),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
