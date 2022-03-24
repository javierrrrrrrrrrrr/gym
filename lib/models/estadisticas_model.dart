// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class EstadisticasModel {
  EstadisticasModel({
    required this.clients,
    required this.newclients,
    required this.trainers,
    required this.newtrainers,
    required this.newpayments,
  });

  int clients;
  int newclients;
  int trainers;
  int newtrainers;
  int newpayments;

  factory EstadisticasModel.fromJson(String str) =>
      EstadisticasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EstadisticasModel.fromMap(Map<String, dynamic> json) =>
      EstadisticasModel(
        clients: json["clients"],
        newclients: json["newclients"],
        trainers: json["trainers"],
        newtrainers: json["newtrainers"],
        newpayments: json["newpayments"],
      );

  Map<String, dynamic> toMap() => {
        "clients": clients,
        "newclients": newclients,
        "trainers": trainers,
        "newtrainers": newtrainers,
        "newpayments": newpayments,
      };
}
