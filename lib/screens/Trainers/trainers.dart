import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';
import '../../helpers/custom_appbar.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppbar(
          context,
          width: width,
          title: "GYM Fitness Model",
          leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
              onPressed: () {
                //showSearch(context: context, delegate: UserSerch());
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: width * 0.080,
              ),
            ),
          ],
        ),
        body: Column(
          children: const [ListViewTrainers()],
        ),
        floatingActionButton: const FloatingABCustom(
          isTrainer: true,
          route: "add_trainer",
        ));
  }
}
