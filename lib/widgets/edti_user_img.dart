import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EditUserImg extends StatefulWidget {
  const EditUserImg({required this.width, required this.height, Key? key})
      : super(key: key);

  final double width;
  final double height;

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
    final imageProvider = Provider.of<SelectImg>(context);
    final usersProvider = Provider.of<UsersProvider>(context);
    User user = usersProvider.selectedUser!;

    return Padding(
      padding: EdgeInsets.only(top: widget.height * 0.045),
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
                    height: widget.height * 0.25,
                    width: widget.width * 0.4,
                    child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage((user.img != "no-avatar.png")
                            ? 'http://78.108.216.56:3000/api/uploads/clients/${user.id}'
                            : 'https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=612x612&w=0&h=f-9tPXlFXtz9vg_-WonCXKCdBuPUevOBkp3DQ-i0xqo=')),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.circular(10)),
                  )),
                )
              : Stack(
                  children: [
                    SizedBox(
                      height: widget.height * 0.25,
                      width: widget.width * 0.4,
                      child: Image.file(
                        imageProvider.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 114,
                      child: GestureDetector(
                        onTap: () {
                          imageProvider.cropFile();
                        },
                        child: Container(
                          color: Colors.white,
                          height: 45,
                          width: 45,
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
            width: widget.width * 0.065,
          ),
          SizedBox(
            height: widget.height * 0.25,
            width: widget.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage('assets/gym.jpeg'),
                  fit: BoxFit.cover,
                  height: widget.height * 0.18,
                ),
                const Text(
                  'Formulario de Inscripción',
                  style: TextStyle(fontSize: 20, color: Colors.black),
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
