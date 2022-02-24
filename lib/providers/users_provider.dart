import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gym/models/createUserModel.dart';

import 'package:gym/models/getUsersModel.dart';
import 'package:http/http.dart' as http;

import '../models/users_model.dart';

class UsersProvider extends ChangeNotifier {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MjExMzc4YTczMTI1ZjZjN2YyN2MzNTYiLCJpYXQiOjE2NDU2NDM2ODksImV4cCI6MTY0NTczMDA4OX0.wUN905rKE_qaAm1rHKI-ajJmVAhaL08DUklq9roK9bY';
  List<User> users = [];
  String photo = "";

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

  // getPictureById(String id) async {
  //   var request = http.Request(
  //       'GET', Uri.parse('http://152.206.177.70:3000/api/uploads/clients/$id'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     photo = await response.stream.bytesToString();
  //     notifyListeners();
  //     return photo;
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  createUser(
    String firstname,
    String lastname,
    int age,
    String height,
    String weight,
    String email,
    String phone,
    String imc,
    String icc,
    String services,
  ) async {
    var headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MjExMzc4YTczMTI1ZjZjN2YyN2MzNTYiLCJpYXQiOjE2NDU2NzI0MjMsImV4cCI6MTY0NTc1ODgyM30.Nlg8DK2a9OP_S9c46SWCl5Krv5nInSLmlfClmKhAB7A',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('http://152.206.177.70:3000/api/clients/'));
    request.body = json.encode({
      "firstname": firstname,
      "lastname": lastname,
      "age": age,
      "height": height,
      "weight": weight,
      "email": email,
      "phone": phone,
      "imc": imc,
      "icc": icc,
      "services": services,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("EL estado de la respuesta: ${response.statusCode}");

    final respuesta =
        GetUsersResponse.fromJson(await response.stream.bytesToString());

    users.add(respuesta.clients.last);
    print(respuesta);
    print(users);
    notifyListeners();
    return "creado correctamete";
  }
}
