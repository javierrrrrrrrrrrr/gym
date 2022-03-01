import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  final String _baseUrl = "http://78.108.216.56:3000";
  final storage = const FlutterSecureStorage();

  Future<String?> loginUser(String email, String password) async {
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
      }
      return '';
    } else {
      print('la respuesta de la Ipi ${response.reasonPhrase}');
      return response.reasonPhrase;
    }
  }

  Future<String> readDataFromStorage(String valor) async {
    return await storage.read(key: valor) ?? '';
  }
}
