import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              CustomNav(
                titulo: "Gestion de Entrenadores",
                height: height,
                width: width,
              ),
              // SizedBox(
              //   height: height * 0.1,
              // ),
              ListViewPage(height: height),
            ],
          ),
          Positioned(
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
              onPressed: () {
                Navigator.pushNamed(context, 'add_trainer');
              },
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: const Image(
                  color: Colors.white,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/add_user.png'),
                ),
              ),
            ),
            bottom: width * 0.09,
            right: width * 0.09,
          ),
        ],
      ),
    ));
  }
}
