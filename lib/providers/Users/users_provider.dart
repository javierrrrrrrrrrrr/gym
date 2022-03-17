import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym/models/Users/create_observation_response.dart';
import 'package:gym/models/Users/create_payment_response.dart';

import 'package:gym/helpers/debouncer.dart';

import 'package:gym/models/search_model.dart';

import 'package:http/http.dart' as http;

import '../../models/models.dart';

class UsersProvider extends ChangeNotifier {
  final String _baseUrl = "http://181.225.253.122:3000";
  final storage = const FlutterSecureStorage();

  List<User> users = [];
  List<User> usersSinPagar = [];
  List<Payment> payments = [];
  List<Observation> observation = [];

  String token = '';
  String imgCreateUser = '';

  User? selectedUser;
  bool isLoading = true;

  Payment? payment;
  bool? _sinPagar = false;

  bool? get sinPagar {
    return _sinPagar;
  }

  set sinPagar(value) {
    _sinPagar = value;
    notifyListeners();
  }

  final debauncer = Debouncer(
    duration: const Duration(milliseconds: 500),
    // onValue: (value){}
  );

  final StreamController<List> _suggestionsStreamController =
      StreamController.broadcast();

  Stream<List> get suggestionStream => _suggestionsStreamController.stream;

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

    final resp = await http.get(Uri.parse("$_baseUrl/api/clients?limit=10000"),
        headers: {HttpHeaders.authorizationHeader: token});

    final Map<String, dynamic> usersmap = json.decode(resp.body);

    final respuesta = GetAllUsersResponse.fromMap(usersmap);

    if (resp.statusCode == 200) {
      isLoading = false;
      notifyListeners();
    }

    users = respuesta.clients;
    notifyListeners();
    return users;
  }

  Future<List<User>> getUsersSinPagar() async {
    usersSinPagar = [];
    for (var i = 0; i < users.length; i++) {
      if (users[i].active == false) {
        usersSinPagar.add(users[i]);
      }
    }
    print(usersSinPagar.length);
    return usersSinPagar;
  }

  Future<String?> createUser({
    required User user,
  }) async {
    await getToken();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$_baseUrl/api/clients/'));
    request.body = json.encode({
      "firstname": user.firstname,
      "lastname": user.lastname,
      "age": user.age,
      "height": user.height,
      "weight": user.weight,
      "email": user.email,
      "phone": user.phone,
      "imc": user.imc,
      "icc": user.icc,
      "services": user.services.isEmpty ? "TRAINING" : user.services[0]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);

    final respuesta =
        CreateUserResponse.fromJson(await response.stream.bytesToString());

    if (response.statusCode == 201) {
      users.add(respuesta.client!);
      users.sort((a, b) => a.firstname.compareTo(b.firstname));
      notifyListeners();

      return respuesta.client!.id;
    } else {
      return '';
    }
  }

  Future<String?> updateUser({
    String? idUserlogin,
    String? trainerId,
    required User user,
  }) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request =
        http.Request('PUT', Uri.parse('$_baseUrl/api/clients/${user.id}'));
    request.body = json.encode({
      "trainer": trainerId == "" ? idUserlogin : trainerId,
      "firstname": user.firstname,
      "lastname": user.lastname,
      "age": user.age,
      "height": user.height,
      "weight": user.weight,
      "email": user.email,
      "phone": user.phone,
      "imc": user.imc,
      "icc": user.icc,
      "services": user.services
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    final respuesta =
        UpdateUserResponse.fromJson(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      final index =
          users.indexWhere((element) => element.id == respuesta.client.id);

      users[index] = respuesta.client;
      users.sort((a, b) => a.firstname.compareTo(b.firstname));
      notifyListeners();

      return respuesta.client.id;
    } else {
      return response.reasonPhrase.toString();
    }
  }

  deleteUser(String id) async {
    await getToken();
    var headers = {'Authorization': token};
    var request =
        http.Request('DELETE', Uri.parse('$_baseUrl/api/clients/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getUsers();
    } else {}
  }

  getUserByID(String id) async {
    await getToken();
    var headers = {'Authorization': token};
    var request = http.Request('GET', Uri.parse('$_baseUrl/api/clients/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final respuesta =
        GetUserByIdResponse.fromJson(await response.stream.bytesToString());

    imgCreateUser = respuesta.client!.img!;
    notifyListeners();
    if (response.statusCode == 200) {
      print('Userid del cliente' + await response.stream.bytesToString());
    } else {}
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

  Future<List> searchUser(String query) async {
    await getToken();
    var headers = {'Authorization': token};
    var request =
        http.Request('GET', Uri.parse('$_baseUrl/api/search/clients/$query'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final searchResponse =
        SearchModel.fromJson(await response.stream.bytesToString());

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

  //Payments !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  Future<Payment> createPaymnet(
      {required String id,
      required String amount,
      required String comment,
      required String mounth}) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request = http.Request('POST', Uri.parse('$_baseUrl/api/payments'));
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

    final index = users.indexWhere((element) => element.id == id);

    users[index].payments!.add(pago.id);
    users[index].active = true;
    await getUsersSinPagar();
    selectedUser!.active = true;
    notifyListeners();
    return pago;
  }

  Future<Payment?> getPaymentByIdentifier(String id) async {
    await getToken();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('$_baseUrl/api/payments/$id'));
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

  Future getAllPaymentsByUserId(String userId) async {
    await getToken();
    payments = [];
    notifyListeners();
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

      payments.add(respuesta);
      notifyListeners();
    }

    if (response.statusCode == 200) {
      return payments;
    } else {
      print(response.reasonPhrase);
    }
  }

  deletePayment(String idPago) async {
    await getToken();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request =
        http.Request('DELETE', Uri.parse('$_baseUrl/api/payments/$idPago'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    //:TODO Eliminar pago local

    if (response.statusCode == 200) {
      final index = payments.indexWhere((element) => element.id == idPago);
      payments.remove(payments[index]);
      selectedUser!.active = false;
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  //Observaciones del user !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  Future getObservationsByIdUser(String idUser) async {
    await getToken();
    observation = [];
    notifyListeners();

    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('$_baseUrl/api/observations/user/$idUser'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final List<dynamic> decodedResp =
        json.decode(await response.stream.bytesToString());
    for (var i = 0; i < decodedResp.length; i++) {
      final Map<String, dynamic> resp = decodedResp[i];
      final respuesta = Observation.fromMap(resp);

      observation.add(respuesta);
      notifyListeners();
    }

    if (response.statusCode == 200) {
      return observation;
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Observation?> createObservation({
    required String icc,
    required String imc,
    required String weight,
    required String observations,
    required String idUser,
  }) async {
    await getToken();
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var request = http.Request('POST', Uri.parse('$_baseUrl/api/observations'));
    request.body = json.encode({
      "icc": icc,
      "imc": imc,
      "weight": weight,
      "observations": observations,
      "client": idUser
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);
    final respuesta = CreateObservationResponse.fromJson(
        await response.stream.bytesToString());

    Observation obs = Observation(
      client: selectedUser!,
      datetime: respuesta.observation.datetime,
      icc: respuesta.observation.icc,
      imc: respuesta.observation.imc,
      observation: respuesta.observation.observation,
      weight: respuesta.observation.weight,
      id: respuesta.observation.id,
      status: respuesta.observation.status,
      v: respuesta.observation.v,
    );

    if (response.statusCode == 201) {
      observation.add(obs);
      notifyListeners();
      return obs;
    } else {
      print(response.reasonPhrase);
    }
  }

  deleteObservation(String idOb) async {
    await getToken();
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var request =
        http.Request('DELETE', Uri.parse('$_baseUrl/api/observations/$idOb'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final index = observation.indexWhere((element) => element.id == idOb);
      observation.remove(observation[index]);
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }
}
