import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym/models/createUserModel.dart';

import 'package:gym/models/getUsersModel.dart';
import 'package:http/http.dart' as http;

import '../models/usersmodel.dart';

class UsersProvider extends ChangeNotifier {
  String token = '';

  List<User> users = [];
  String photo = "";
  final storage = const FlutterSecureStorage();

  UsersProvider() {
    getUsers();
  }
  Future<String> readDataFromStorage(String valor) async {
    return await storage.read(key: valor) ?? '';
  }

  Future<String> getToken() async {
    token = await readDataFromStorage('token');
    notifyListeners();
    return token;
  }

  getUsers() async {
    await getToken();

    final resp = await http.get(
        Uri.parse("http://152.206.177.70:3000/api/clients?limit=1000&page=1"),
        headers: {HttpHeaders.authorizationHeader: token});

    final Map<String, dynamic> usersmap = json.decode(resp.body);

    final respuesta = GetUsersResponse.fromMap(usersmap);

    users = respuesta.clients;
    notifyListeners();
    print(users);
  }

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
    await getToken();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://152.206.177.70:3000/api/clients?limit=1000&page=1'));
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
      "services": "TRAINING"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    print("EL estado de la respuesta: ${response.statusCode}");

    final respuesta =
        CreateUserResponse.fromJson(await response.stream.bytesToString());

    users.add(respuesta.client!);

    print(respuesta);
    print(users);
    notifyListeners();
    return "creado correctamete";
  }
}
