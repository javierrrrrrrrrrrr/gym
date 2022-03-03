import 'package:flutter/material.dart';
import 'package:gym/search/search_delegate.dart';

class CustomNav extends StatelessWidget {
  const CustomNav({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(height * 0.015),
            bottomRight: Radius.circular(height * 0.015)),
        child: Container(
          color: const Color.fromRGBO(45, 49, 146, 1),
          height: height * 0.184,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.085, right: width * 0.085),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.060, vertical: width * 0.04),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.03))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03)),
                    ),
                    hintText: '    Buscar Usuario',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(150, 152, 154, 0.5),
                      fontSize: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: UserSerch());
                      },
                      icon: Icon(
                        Icons.search,
                        color: const Color.fromRGBO(150, 152, 154, 0.5),
                        size: width * 0.090,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
