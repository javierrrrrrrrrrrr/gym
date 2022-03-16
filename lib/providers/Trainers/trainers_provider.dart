import 'dart:convert';
import 'package:gym/models/Users/create_trainers_response.dart';
import 'package:gym/models/edit_trainer_response.dart';
import 'package:gym/models/get_trainer_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';

import '../../models/trainer_model.dart';

class TrainerProvider extends ChangeNotifier {
  final String _baseUrl = "http://b6f6-152-206-119-224.ngrok.io";
  String token = '';
  final storage = const FlutterSecureStorage();

  List<Trainer> trainers = [];
  Trainer? selectedTrainer;

  Future<String> readDataFromStorage(String valor) async {
    return await storage.read(key: valor) ?? '';
  }

  Future<String> getToken() async {
    token = await readDataFromStorage('token');
    notifyListeners();
    return token;
  }

  Future<String> getTrainers() async {
    await getToken();
    var headers = {
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('GET',
        Uri.parse("https://b6f6-152-206-119-224.ngrok.io/api/trainers/"));
    request.bodyFields = {'Authoriza': ''};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final respuesta =
          GetTrainerResponse.fromJson(await response.stream.bytesToString());
      trainers = respuesta.users;
      trainers.sort((a, b) => a.name.compareTo(b.name));
      notifyListeners();

      return '';
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }

  Future<String> crearEntrandor(
      {required Trainer trainer, required String password}) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request =
        http.Request('POST', Uri.parse('$_baseUrl/api/auth/register'));
    request.body = json.encode(
        {"name": trainer.name, "email": trainer.email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final respuesta =
          CreateTrainerResponse.fromJson(await response.stream.bytesToString());

      trainers.add(respuesta.user);
      trainers.sort((a, b) => a.name.compareTo(b.name));
      notifyListeners();
      return respuesta.user.uid!;
    } else {
      return '';
    }
  }

  Future<Trainer?> editTrainer(
      {required Trainer trainer, required String? password}) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request = http.Request('PUT',
        Uri.parse('http://78.108.216.56:3000/api/trainers/${trainer.uid}'));
    request.body = json.encode({
      "name": trainer.name,
      "email": trainer.email,
      "password": password ?? '12345678'
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final respuesta =
          EditTrainerResponse.fromJson(await response.stream.bytesToString());

      final index =
          trainers.indexWhere((element) => element.uid == respuesta.client.uid);

      trainers[index] = respuesta.client;
      notifyListeners();
      return respuesta.client;
    }
  }

  Future<Trainer?> deleteTrainer(Trainer trainer) async {
    await getToken();
    var headers = {
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('DELETE',
        Uri.parse('http://78.108.216.56:3000/api/trainers/${trainer.uid}'));
    request.bodyFields = {'Authoriza': ''};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final index =
          trainers.indexWhere((element) => element.uid == trainer.uid);
      trainers.removeAt(index);
      notifyListeners();
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
        'PUT', Uri.parse('$_baseUrl/api/uploads/users/$userid'));
    request.files.add(await http.MultipartFile.fromPath('archivo', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final respuesta = Trainer.fromJson(await response.stream.bytesToString());
    final index =
        trainers.indexWhere((element) => element.uid == respuesta.uid);
    trainers[index] = respuesta;
    notifyListeners();
  }
}
