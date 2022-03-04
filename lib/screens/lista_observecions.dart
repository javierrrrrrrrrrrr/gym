import 'package:flutter/material.dart';
import 'package:gym/models/models.dart';
import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class ListaObservaciones extends StatelessWidget {
  const ListaObservaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: const [
            CustomNav(
              title: "Lista de observaciones",
            ),
            ListViewOB(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
          onPressed: () {
            Navigator.pushNamed(context, 'ob');
          },
          child: const Icon(
            Icons.remove_red_eye_sharp,
            size: 35,
            color: Colors.white,
          ),
        ));
  }
}

class ListViewOB extends StatefulWidget {
  const ListViewOB({Key? key}) : super(key: key);

  @override
  State<ListViewOB> createState() => _ListViewOBState();
}

class _ListViewOBState extends State<ListViewOB> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    return Expanded(
      child: ListView.separated(
          itemCount: userProvider.observation.length,
          itemBuilder: (BuildContext context, index) {
            return ObservationListBody(
              observation: userProvider.observation[index],
            );
          },
          padding: const EdgeInsets.all(0),
          separatorBuilder: (BuildContext context, index) {
            return const Divider(
              height: 10,
              color: Colors.black,
            );
          }
          //  padding: const EdgeInsets.only(bottom: 10),
          ),
    );
  }
}

class ObservationListBody extends StatelessWidget {
  final Observation observation;
  const ObservationListBody({Key? key, required this.observation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fecha:${observation.datetime}",
            style: const TextStyle(fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "IMC: ${observation.imc}",
                style: const TextStyle(fontSize: 21),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "ICC: ${observation.icc}",
                style: const TextStyle(fontSize: 21),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Peso: ${userProvider.selectedUser!.weight}Kg",
                style: const TextStyle(fontSize: 21),
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(
                Icons.delete,
                size: 30,
              ),
            ],
          ),
          Text(
            observation.observation,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
