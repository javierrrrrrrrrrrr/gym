import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.78,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
                listitem(),
              ],
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  ListTile listitem() {
    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      dense: true,
      leading: Stack(
        children: [
          Image(
            width: widget.height * 0.09,
            height: widget.height * 0.09,
            fit: BoxFit.cover,
            image: const AssetImage('assets/user.png'),
          ),
          Positioned(
            bottom: 0,
            right: widget.height * 0.015,
            child: Container(
              height: widget.height * 0.012,
              width: widget.height * 0.012,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.height * 0.01),
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      title: const Text(
        "Adonys Valdes Arencibia",
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Row(
        children: const [
          Icon(Icons.phone),
          Text(
            '+5358542967',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
      trailing: const Icon(
        Icons.edit,
        size: 40,
      ),
    );
  }
}
