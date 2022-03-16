import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = "https://a72d-152-206-119-224.ngrok.io";
const storage = FlutterSecureStorage();

class LoginProvider extends ChangeNotifier {
  bool recordarContrasena = false;
  String contrsenaGuardada = '';
  String usuarioGuardado = '';
  Future<String?> loginUser(String email, String password, bool check) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$_baseUrl/api/auth/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResp =
          json.decode(await response.stream.bytesToString());
      if (decodedResp.containsKey('token')) {
        await storage.write(key: 'token', value: decodedResp['token']);
        if (check == true) {
          await storage.write(key: 'contrasena', value: password);
          await storage.write(key: 'usuario', value: email);
          await storage.write(key: 'recordar', value: 'true');
        } else {
          await storage.write(key: 'recordar', value: 'false');
        }
      }
      return '';
    } else {
      return response.reasonPhrase;
    }
  }

  Future<String> readDataFromStorage(String valor) async {
    return await storage.read(key: valor) ?? '';
  }
}
