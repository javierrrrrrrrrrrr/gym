import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';

class TrainerProvider extends ChangeNotifier {
  final String _baseUrl = "http://78.108.216.56:3000";
  String token = '';
  final storage = const FlutterSecureStorage();
  // List<> users = [];

  Future<String> readDataFromStorage(String valor) async {
    return await storage.read(key: valor) ?? '';
  }

  Future<String> getToken() async {
    token = await readDataFromStorage('token');
    notifyListeners();
    return token;
  }

  Future<String> CrearEntrandor(
      String nombre, String email, String password) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request =
        http.Request('POST', Uri.parse('$_baseUrl/api/auth/register'));
    request.body =
        json.encode({"name": nombre, "email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    return '';
  }
}
