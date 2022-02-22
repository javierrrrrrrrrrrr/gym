import 'package:meta/meta.dart';
import 'dart:convert';

class CreateUserResponse {
  CreateUserResponse({
    @required this.client,
  });

  Client? client;

  CreateUserResponse copyWith({
    Client? client,
  }) =>
      CreateUserResponse(
        client: client ?? this.client,
      );

  factory CreateUserResponse.fromJson(String str) =>
      CreateUserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateUserResponse.fromMap(Map<String, dynamic> json) =>
      CreateUserResponse(
        client: Client.fromMap(json["client"]),
      );

  Map<String, dynamic> toMap() => {
        "client": client!.toMap(),
      };
}

class Client {
  Client({
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.height,
    required this.weight,
    required this.email,
    required this.datetime,
    required this.phone,
    required this.imc,
    required this.icc,
    required this.services,
    required this.status,
    required this.payments,
    required this.observations,
    required this.trainer,
    required this.img,
    required this.id,
    required this.v,
  });

  String firstname;
  String lastname;
  int age;
  String height;
  String weight;
  String email;
  DateTime datetime;
  String phone;
  String imc;
  String icc;
  List<String> services;
  bool status;
  List<dynamic> payments;
  List<dynamic> observations;
  String trainer;
  String img;
  String id;
  int v;

  Client copyWith({
    String? firstname,
    String? lastname,
    int? age,
    String? height,
    String? weight,
    String? email,
    DateTime? datetime,
    String? phone,
    String? imc,
    String? icc,
    List<String>? services,
    bool? status,
    List<dynamic>? payments,
    List<dynamic>? observations,
    String? trainer,
    String? img,
    String? id,
    int? v,
  }) =>
      Client(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        email: email ?? this.email,
        datetime: datetime ?? this.datetime,
        phone: phone ?? this.phone,
        imc: imc ?? this.imc,
        icc: icc ?? this.icc,
        services: services ?? this.services,
        status: status ?? this.status,
        payments: payments ?? this.payments,
        observations: observations ?? this.observations,
        trainer: trainer ?? this.trainer,
        img: img ?? this.img,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        email: json["email"],
        datetime: DateTime.parse(json["datetime"]),
        phone: json["phone"],
        imc: json["imc"],
        icc: json["icc"],
        services: List<String>.from(json["services"].map((x) => x)),
        status: json["status"],
        payments: List<dynamic>.from(json["payments"].map((x) => x)),
        observations: List<dynamic>.from(json["observations"].map((x) => x)),
        trainer: json["trainer"],
        img: json["img"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "height": height,
        "weight": weight,
        "email": email,
        "datetime": datetime.toIso8601String(),
        "phone": phone,
        "imc": imc,
        "icc": icc,
        "services": List<dynamic>.from(services.map((x) => x)),
        "status": status,
        "payments": List<dynamic>.from(payments.map((x) => x)),
        "observations": List<dynamic>.from(observations.map((x) => x)),
        "trainer": trainer,
        "img": img,
        "_id": id,
        "__v": v,
      };
}
