import 'package:flutter/material.dart';

import 'package:gym/models/Trainers/trainer_model.dart';

import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EditTrainerImg extends StatefulWidget {
  const EditTrainerImg({Key? key}) : super(key: key);

  @override
  State<EditTrainerImg> createState() => _EditTrainerImgState();
}

class _EditTrainerImgState extends State<EditTrainerImg> {
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
    final trainerProvider = Provider.of<TrainerProvider>(context);

    Trainer trainer = trainerProvider.selectedTrainer!;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.045),
      child: Container(
        color: const Color.fromRGBO(253, 254, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageProvider.imagePath == ""
                ? GestureDetector(
                    onTap: () {
                      imageProvider.isTouch = true;
                      try {
                        imageProvider.pikeImage();
                      } on Exception {
                        null;
                      }
                    },
                    child: Container(
                      height: height * 0.25,
                      width: width * 0.4,
                      child: (trainer.img != "no-avatar.png")
                          ? Hero(
                              tag: trainer.uid!,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(width * 0.025),
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder:
                                      const AssetImage('assets/images.jpg'),
                                  image: NetworkImage(
                                      'http://181.225.253.122:3000/api/uploads/users/${trainer.uid}'),
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
                    ),
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
                    style:
                        TextStyle(fontSize: width * 0.05, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
