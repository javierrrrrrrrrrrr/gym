import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym/helpers/debouncer.dart';

import 'package:gym/models/getUserByIdResponse.dart';
import 'package:gym/models/search_model.dart';

import 'package:gym/models/updateUserResponse.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class UsersProvider extends ChangeNotifier {
  final String _baseUrl = "http://78.108.216.56:3000";
  final storage = const FlutterSecureStorage();

  List<User> users = [];
  String token = '';
  String imgCreateUser = '';

  User? selectedUser;
  bool isLoading = true;

  final debauncer = Debouncer(
    duration: const Duration(milliseconds: 500),
    // onValue: (value){}
  );

  final StreamController<List> _suggestionsStreamController =
      StreamController.broadcast();

  Stream<List> get suggestionStream => this._suggestionsStreamController.stream;

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

    final resp = await http.get(Uri.parse("$_baseUrl/api/clients?limit=100"),
        headers: {HttpHeaders.authorizationHeader: token});

    final Map<String, dynamic> usersmap = json.decode(resp.body);

    final respuesta = GetUsersResponse.fromMap(usersmap);

    if (resp.statusCode == 200) {
      isLoading = false;
      notifyListeners();
    }

    users = respuesta.clients;
    notifyListeners();
    return users;
  }

  Future<String> createUser({
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
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('$_baseUrl/api/clients?limit=1000&page=1'));
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
    print("EL estado de la respuesta: ${response.reasonPhrase}");

    final respuesta =
        CreateUserResponse.fromJson(await response.stream.bytesToString());
    print("esta es la respuesta del create user: ${respuesta.client!.img}");

    if (response.statusCode == 201) {
      await getUsers();

      return respuesta.client!.id;
    } else {
      return '';
    }
  }

  Future<String> updateUser({
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
    var request = http.Request('PUT', Uri.parse('$_baseUrl/api/clients/$id'));
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
    final respuesta =
        UpdateUserResponse.fromJson(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      print(respuesta.client.id);
      return respuesta.client.id;
    } else {
      return response.reasonPhrase.toString();
    }
  }

  deleteUser(String id) async {
    await getToken();
    var headers = {'Authorization': token};
    var request = http.Request(
        'DELETE', Uri.parse('http://78.108.216.56:3000/api/clients/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getUsers();
    } else {
      print(response.reasonPhrase);
    }
  }

  getUserByID(String id) async {
    await getToken();
    var headers = {'Authorization': token};
    var request = http.Request(
        'GET', Uri.parse('http://78.108.216.56:3000/api/clients/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final respuesta =
        GetUserByIdResponse.fromJson(await response.stream.bytesToString());
    print(respuesta.client!.img);
    imgCreateUser = respuesta.client!.img!;
    notifyListeners();
    if (response.statusCode == 200) {
      print('Userid del cliente' + await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  getImg(String id) async {
    var request =
        http.Request('GET', Uri.parse('$_baseUrl/api/uploads/clients/$id'));

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
    var request = http.MultipartRequest(
        'PUT', Uri.parse('$_baseUrl/api/uploads/clients/$userid'));
    request.files.add(await http.MultipartFile.fromPath('archivo', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      await getUsers();
    }
  }

  Future<List> searchUser(String query) async {
    await getToken();
    var headers = {'Authorization': token};
    var request = http.Request('GET',
        Uri.parse('http://78.108.216.56:3000/api/search/clients/$query'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final searchResponse =
        SearchModel.fromJson(await response.stream.bytesToString());

    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
    }
    return searchResponse.clientes;
  }

  void getSuggestionByQuery(String serchterm) {
    debauncer.value = '';
    debauncer.onValue = (value) async {
      final result = await searchUser(value);
      _suggestionsStreamController.add(result);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debauncer.value = serchterm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
