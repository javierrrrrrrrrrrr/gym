import 'dart:convert';
// To parse this JSON data, do
//
//     final observation = observationFromMap(jsonString);

import 'package:gym/models/models.dart';

class Observation {
  Observation({
    required this.id,
    required this.datetime,
    required this.icc,
    required this.imc,
    required this.weight,
    required this.observation,
    required this.client,
    required this.status,
    required this.v,
  });

  String id;
  String datetime;
  int icc;
  int imc;
  int weight;
  String observation;
  User client;
  bool status;
  int v;

  Observation copyWith({
    String? id,
    String? datetime,
    int? icc,
    int? imc,
    int? weight,
    String? observation,
    User? client,
    bool? status,
    int? v,
  }) =>
      Observation(
        id: id ?? this.id,
        datetime: datetime ?? this.datetime,
        icc: icc ?? this.icc,
        imc: imc ?? this.imc,
        weight: weight ?? this.weight,
        observation: observation ?? this.observation,
        client: client ?? this.client,
        status: status ?? this.status,
        v: v ?? this.v,
      );

  factory Observation.fromJson(String str) =>
      Observation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Observation.fromMap(Map<String, dynamic> json) => Observation(
        id: json["_id"],
        datetime: json["datetime"],
        icc: json["icc"] ?? 0,
        imc: json["imc"] ?? 0,
        weight: json["weight"] ?? 0,
        observation: json["observation"],
        client: User.fromMap(json["client"]),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "datetime": datetime,
        "icc": icc,
        "imc": imc,
        "weight": weight,
        "observation": observation,
        "client": client.toMap(),
        "status": status,
        "__v": v,
      };
}
