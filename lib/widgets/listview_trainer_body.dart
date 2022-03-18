import 'package:flutter/material.dart';
import 'package:gym/models/Trainers/trainer_model.dart';
import 'package:gym/providers/providers.dart';
import 'package:provider/provider.dart';

class ListViewTrainerBody extends StatelessWidget {
  const ListViewTrainerBody({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  final Trainer trainer;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final trainerProvider = Provider.of<TrainerProvider>(context);
    final trainerFormController = Provider.of<TrainersFormController>(context);
    return GestureDetector(
      onTap: () {
        trainerProvider.selectedTrainer = trainer.copyWith();
        trainerFormController.trainer = trainer.copyWith();

        Navigator.pushNamed(context, 'edit_trainer');
      },
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.025),
        child: SizedBox(
          height: 75,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (trainer.img != "no-avatar.png")
                  ? Hero(
                      tag: trainer.uid!,
                      child: CircleAvatar(
                        radius: width * 0.065,
                        backgroundImage: const AssetImage('assets/images.jpg'),
                        foregroundImage: NetworkImage(
                            'http://181.225.253.122:3000/api/uploads/users/${trainer.uid}'),
                      ),
                    )
                  : Hero(
                      tag: trainer.uid!,
                      child: CircleAvatar(
                        radius: width * 0.065,
                        backgroundImage: const AssetImage('assets/images.jpg'),
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trainer.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.email),
                          SizedBox(
                            width: width * 0.025,
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: width * 0.55,
                              child: Text(
                                trainer.email,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.025),
                child: IconButton(
                  onPressed: () {
                    trainerProvider.selectedTrainer = trainer.copyWith();
                    trainerFormController.trainer = trainer.copyWith();

                    Navigator.pushNamed(context, 'edit_trainer');
                  },
                  icon: const Icon(Icons.edit, size: 35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
