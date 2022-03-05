// To parse this JSON data, do
//
//     final createPaymentResponse = createPaymentResponseFromMap(jsonString);

import 'dart:convert';

class GetAllUsersResponse {
  GetAllUsersResponse({
    required this.clients,
  });

  List<User> clients;

  GetAllUsersResponse copyWith({
    List<User>? clients,
  }) =>
      GetAllUsersResponse(
        clients: clients ?? this.clients,
      );

  factory GetAllUsersResponse.fromJson(String str) =>
      GetAllUsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllUsersResponse.fromMap(Map<String, dynamic> json) =>
      GetAllUsersResponse(
        clients: List<User>.from(json["clients"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "clients": List<dynamic>.from(clients.map((x) => x.toMap())),
      };
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.height,
    required this.weight,
    this.email,
    this.datetime,
    required this.phone,
    this.imc,
    this.icc,
    required this.services,
    this.status,
    this.payments,
    this.observations,
    this.trainer,
    this.img,
    this.servicedays,
    this.v,
    this.active,
    this.activeto,
  });

  String id;
  String firstname;
  String lastname;
  int age;
  String height;
  String weight;
  String? email;
  DateTime? datetime;
  String phone;
  String? imc;
  String? icc;
  List<String> services;
  bool? status;
  List<String>? payments;
  List<String>? observations;
  String? trainer;
  String? img;
  int? servicedays;
  int? v;
  bool? active;
  String? activeto;

  User copyWith({
    String? id,
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
    List<String>? payments,
    List<String>? observations,
    String? trainer,
    String? img,
    int? servicedays,
    int? v,
    bool? active,
    String? activeto,
  }) =>
      User(
        id: id ?? this.id,
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
        servicedays: servicedays ?? this.servicedays,
        v: v ?? this.v,
        active: active ?? this.active,
        activeto: activeto ?? this.activeto,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
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
        payments: List<String>.from(json["payments"].map((x) => x)),
        observations: List<String>.from(json["observations"].map((x) => x)),
        trainer: json["trainer"],
        img: json["img"],
        servicedays: json["servicedays"],
        v: json["__v"],
        active: json["active"],
        activeto: json["activeto"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "height": height,
        "weight": weight,
        "email": email,
        "datetime": datetime,
        "phone": phone,
        "imc": imc,
        "icc": icc,
        "services": List<dynamic>.from(services.map((x) => x)),
        "status": status,
        "payments": List<dynamic>.from(payments!.map((x) => x)),
        "observations": List<dynamic>.from(observations!.map((x) => x)),
        "trainer": trainer,
        "img": img,
        "servicedays": servicedays,
        "__v": v,
        "active": active,
        "activeto": activeto,
      };
}
