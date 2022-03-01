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
  User? selectedUser;

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

  Future<List<User>> getUsers() async {
    await getToken();

    final resp = await http.get(
        Uri.parse("http://152.206.177.70:3000/api/clients?limit=1000&page=1"),
        headers: {HttpHeaders.authorizationHeader: token});

    final Map<String, dynamic> usersmap = json.decode(resp.body);

    final respuesta = GetUsersResponse.fromMap(usersmap);

    users = respuesta.clients;
    notifyListeners();
    return users;
    print(users);
  }

  Future<String> createUser(
    String firstname,
    String lastname,
    int age,
    String height,
    String weight,
    String email,
    String phone,
    String imc,
    String icc,
    List<String> services,
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
      "services": services,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("EL estado de la respuesta: ${response.statusCode}");

    final respuesta =
        CreateUserResponse.fromJson(await response.stream.bytesToString());

    if (response.statusCode == 201) {
      getUsers();
      notifyListeners();

      return respuesta.client!.id;
    } else {
      return '';
    }
  }

  Future updateUser({
    required String id,
    required String firstname,
    required String lastname,
    required int age,
    required String height,
    required String weight,
    required String email,
    required String phone,
    required String imc,
    required String icc,
    required List<String> services,
  }) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request = http.Request(
        'PUT', Uri.parse('http://152.206.177.70:3000/api/clients/$id'));
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
      "services": services
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getUsers();
    } else {
      print(response.reasonPhrase);
    }
  }

  getImg(String id) async {
    var request = http.Request(
        'GET', Uri.parse('http://152.206.177.70:3000/api/uploads/clients/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future uploadImage(String path, String userid) async {
    await getToken();
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': token
    };
    var request = http.MultipartRequest('PUT',
        Uri.parse('http://152.206.177.70:3000/api/uploads/clients/$userid'));
    request.files.add(await http.MultipartFile.fromPath('archivo', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
  }
}
