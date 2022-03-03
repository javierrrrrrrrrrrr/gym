// ignore_for_file: file_names

import 'dart:convert';

import 'package:gym/models/models.dart';

class GetUserByIdResponse {
  GetUserByIdResponse({
    this.client,
  });

  User? client;

  factory GetUserByIdResponse.fromJson(String str) =>
      GetUserByIdResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetUserByIdResponse.fromMap(Map<String, dynamic> json) =>
      GetUserByIdResponse(
        client: User.fromMap(json["client"]),
      );

  Map<String, dynamic> toMap() => {
        "client": client!.toMap(),
      };
}

class Trainer {
  Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.img,
    required this.rol,
    required this.status,
    required this.v,
  });

  String id;
  String name;
  String email;
  String password;
  String img;
  String rol;
  bool status;
  int v;

  factory Trainer.fromJson(String str) => Trainer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Trainer.fromMap(Map<String, dynamic> json) => Trainer(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        img: json["img"],
        rol: json["rol"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "img": img,
        "rol": rol,
        "status": status,
        "__v": v,
      };
}
