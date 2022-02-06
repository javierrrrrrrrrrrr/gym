import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: height * 0.04),
                height: height * 0.5,
                width: width,
                child: const Image(
                  image: AssetImage('assets/gym.jpeg'),
                )),
            SizedBox(
              height: height * 0.12,
              width: width * 0.45,
              child: const Text(
                'Acceder al panel de Administracion del Gimnasio',
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(
              width: width * 0.8,
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 6),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(45, 49, 146, 1))),
                      hintText: '  avaldesa007@gmail.com',
                      hintStyle:
                          const TextStyle(color: Colors.black54, fontSize: 20),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check_circle,
                            color: Color.fromRGBO(150, 152, 154, 0.5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(45, 49, 146, 1))),
                      hintText: '  Enter Password',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(150, 152, 154, 0.5),
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromRGBO(45, 49, 146, 1),
                      ),
                      child: const Center(
                        child: Text(
                          "Acceder",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              fontSize: 22),
                        ),
                      ),
                      height: height * 0.055,
                      width: width * 0.65,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'Admin');
                    },
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
