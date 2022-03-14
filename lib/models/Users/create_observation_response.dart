// To parse this JSON data, do
//
//     final createObservationResponse = createObservationResponseFromMap(jsonString);

import 'dart:convert';

class CreateObservationResponse {
  CreateObservationResponse({
    required this.observation,
  });

  Observacion observation;

  CreateObservationResponse copyWith({
    Observacion? observation,
  }) =>
      CreateObservationResponse(
        observation: observation ?? this.observation,
      );

  factory CreateObservationResponse.fromJson(String str) =>
      CreateObservationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateObservationResponse.fromMap(Map<String, dynamic> json) =>
      CreateObservationResponse(
        observation: Observacion.fromMap(json["observation"]),
      );

  Map<String, dynamic> toMap() => {
        "observation": observation.toMap(),
      };
}

class Observacion {
  Observacion({
    required this.datetime,
    required this.icc,
    required this.imc,
    required this.weight,
    required this.observation,
    required this.client,
    required this.status,
    required this.id,
    required this.v,
  });

  String datetime;
  int icc;
  int imc;
  int weight;
  String observation;
  String client;
  bool status;
  String id;
  int v;

  Observacion copyWith({
    String? datetime,
    int? icc,
    int? imc,
    int? weight,
    String? observation,
    String? client,
    bool? status,
    String? id,
    int? v,
  }) =>
      Observacion(
        datetime: datetime ?? this.datetime,
        icc: icc ?? this.icc,
        imc: imc ?? this.imc,
        weight: weight ?? this.weight,
        observation: observation ?? this.observation,
        client: client ?? this.client,
        status: status ?? this.status,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Observacion.fromJson(String str) =>
      Observacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Observacion.fromMap(Map<String, dynamic> json) => Observacion(
        datetime: json["datetime"],
        icc: json["icc"],
        imc: json["imc"],
        weight: json["weight"],
        observation: json["observation"],
        client: json["client"],
        status: json["status"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "datetime": datetime,
        "icc": icc,
        "imc": imc,
        "weight": weight,
        "observation": observation,
        "client": client,
        "status": status,
        "_id": id,
        "__v": v,
      };
}
