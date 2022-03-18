import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';

import 'package:gym/widgets/listview_trainer_body.dart';

import 'package:provider/provider.dart';

import '../../providers/Trainers/trainers_provider.dart';

class ListViewTrainers extends StatefulWidget {
  const ListViewTrainers({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewTrainers> createState() => _ListViewUsersState();
}

class _ListViewUsersState extends State<ListViewTrainers> {
  @override
  Widget build(BuildContext context) {
    final trainerProvider = Provider.of<TrainerProvider>(context);

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: trainerProvider.trainers.length,
        itemBuilder: (BuildContext context, index) {
          return ListViewTrainerBody(trainer: trainerProvider.trainers[index]);
        },
        padding: const EdgeInsets.all(0),
        //  padding: const EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
