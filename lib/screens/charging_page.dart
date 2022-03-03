import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ChargingPage extends StatefulWidget {
  const ChargingPage({Key? key}) : super(key: key);

  @override
  ChargingPageState createState() => ChargingPageState();
}

class ChargingPageState extends State<ChargingPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    return (Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 50,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(500),
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: userProvider.users.length,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
