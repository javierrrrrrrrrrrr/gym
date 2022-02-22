import 'package:flutter/cupertino.dart';

import 'package:gym/models/getUsersModel.dart';
import 'package:http/http.dart' as http;

import '../models/users_model.dart';

class UsersProvider extends ChangeNotifier {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MjExMzc4YTczMTI1ZjZjN2YyN2MzNTYiLCJpYXQiOjE2NDU0ODg3MDYsImV4cCI6MTY0NTU3NTEwNn0.TndUl1jC8C2VE356REm2O2kUZKhqOEzbY5mXcYrecbM';
  List<User> users = [];
  UsersProvider() {
    getUsers();
  }

  getUsers() async {
    var headers = {'Authorization': token};
    var request = http.Request(
        'GET', Uri.parse('http://152.206.177.70:3000/api/clients'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final respuesta =
        GetUsersResponse.fromJson(await response.stream.bytesToString());

    users = respuesta.clients;
    notifyListeners();
    print(users);
  }

  // Future<String> createUser(
  //   String token,
  //   String firstname,
  //   String lastname,
  //   int age,
  //   String height,
  //   String weight,
  //   String email,
  //   String phone,
  //   String imc,
  //   String icc,
  //   String services,
  // ) async {
  //   var headers = {'Authorization': token, 'Content-Type': 'application/json'};
  //   var request = http.Request(
  //       'POST', Uri.parse('http://152.206.177.70:3000/api/clients/'));
  //   request.body = json.encode({
  //     "firstname": firstname,
  //     "lastname": lastname,
  //     "age": age,
  //     "height": height,
  //     "weight": weight,
  //     "email": email,
  //     "phone": phone,
  //     "imc": imc,
  //     "icc": icc,
  //     "services": services,
  //   });
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   final respuesta =
  //       CreateUserResponse.fromJson(await response.stream.bytesToString());
  //   print(respuesta);

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     return "creado correctamete";
  //   } else {
  //     print(response.reasonPhrase);
  //     return "Error";
  //   }
  // }
}
