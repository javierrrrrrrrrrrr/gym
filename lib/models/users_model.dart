import 'dart:convert';

class User {
  User({
    required this.id,
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
    required this.v,
  });

  String id;
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
  List<String> payments;
  List<dynamic> observations;
  String trainer;
  String img;
  int v;

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
    List<dynamic>? observations,
    String? trainer,
    String? img,
    int? v,
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
        v: v ?? this.v,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

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
        observations: List<dynamic>.from(json["observations"].map((x) => x)),
        trainer: json["trainer"],
        img: json["img"],
        v: json["__v"],
      );
}
