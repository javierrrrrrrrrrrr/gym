import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym/models/create_payment_response.dart';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class UsersProvider extends ChangeNotifier {
  final String _baseUrl = "http://78.108.216.56:3000";
  final storage = const FlutterSecureStorage();

  List<User> users = [];
  List<Payment> payments = [];

  String token = '';
  String imgCreateUser = '';

  User? selectedUser;
  bool isLoading = true;

  Payment? payment;

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
    final respuesta = User.fromJson(await response.stream.bytesToString());
    final index = users.indexWhere((element) => element.id == respuesta.id);
    users[index] = respuesta;
    notifyListeners();
    if (response.statusCode == 200) {
      await getUsers();
    }
  }

  //Payments

  Future<Payment> createPaymnet(
      {required String id,
      required String amount,
      required String comment,
      required String mounth}) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request = http.Request(
        'POST', Uri.parse('http://78.108.216.56:3000/api/payments'));
    request.body = json.encode(
        {"amount": amount, "client": id, "months": mounth, "comment": comment});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final respuesta =
        CreatePaymentResponse.fromJson(await response.stream.bytesToString());
    Payment pago = Payment(
        amount: respuesta.payment.amount,
        comment: respuesta.payment.comment,
        datetime: respuesta.payment.datetime,
        days: respuesta.payment.days,
        discount: respuesta.payment.discount,
        id: respuesta.payment.id,
        status: respuesta.payment.status,
        v: respuesta.payment.v,
        client: selectedUser!);

    payments.add(pago);
    notifyListeners();
    return pago;
  }

  Future<Payment?> getPaymentByIdentifier(String id) async {
    await getToken();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('http://78.108.216.56:3000/api/payments/$id'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final respuesta = Payment.fromJson(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      payment = respuesta;
      notifyListeners();
      return payment;
    } else {
      return null;
    }
  }

  Future<List<Payment>> getAllPaymentsByIdnety() async {
    int index = selectedUser!.payments!.length;

    for (var i = 0; i < index; i++) {
      payments.add((await getPaymentByIdentifier(selectedUser!.payments![i]))!);
      notifyListeners();
    }

    return payments;
  }

  getAllPaymentsByUserId(String userId) async {
    getToken();

    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request =
        http.Request('GET', Uri.parse('$_baseUrl/api/payments/user/$userId'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final List<dynamic> decodedResp =
        json.decode(await response.stream.bytesToString());

    for (var i = 0; i < decodedResp.length; i++) {
      final Map<String, dynamic> resp = decodedResp[i];
      final respuesta = Payment.fromMap(resp);

      payments = [...payments, respuesta];
      notifyListeners();
    }

    if (response.statusCode == 200) {
      return payments;
    } else {
      print(response.reasonPhrase);
    }
  }
}
