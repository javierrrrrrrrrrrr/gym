import 'package:flutter/material.dart';
import 'package:gym/providers/Users/image_provider.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SelectIMGWidget extends StatelessWidget {
  const SelectIMGWidget({required this.width, required this.height, Key? key})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<SelectImg>(context);

    return Padding(
      padding: EdgeInsets.only(top: height * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageProvider.imagePath == ""
              ? GestureDetector(
                  onTap: () {
                    try {
                      imageProvider.pikeImage();
                    } on Exception catch (e) {
                      // TODO
                    }
                  },
                  child: ImgUserContainer(
                      child: Container(
                    height: height * 0.25,
                    width: width * 0.4,
                    child: const Center(
                        child: Text(
                      'Seleccione la imagen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(240, 240, 240, 1)),
                    )),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(196, 196, 196, 1),
                      borderRadius: BorderRadius.circular(width * 0.025),
                    ),
                  )),
                )
              : Stack(
                  children: [
                    SizedBox(
                      height: height * 0.25,
                      width: width * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width * 0.025),
                        child: Image.file(
                          imageProvider.img!,
                          fit: BoxFit.cover,
                        ),
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
            width: width * 0.065,
          ),
          //Segunda foto del GYM
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
