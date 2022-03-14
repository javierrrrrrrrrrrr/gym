// To parse this JSON data, do
//
//     final getTrainerResponse = getTrainerResponseFromMap(jsonString);

import 'dart:convert';

import 'trainer_model.dart';

class GetTrainerResponse {
  GetTrainerResponse({
    required this.users,
  });

  List<Trainer> users;

  GetTrainerResponse copyWith({
    List<Trainer>? users,
  }) =>
      GetTrainerResponse(
        users: users ?? this.users,
      );

  factory GetTrainerResponse.fromJson(String str) =>
      GetTrainerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetTrainerResponse.fromMap(Map<String, dynamic> json) =>
      GetTrainerResponse(
        users: List<Trainer>.from(json["users"].map((x) => Trainer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
      };
}
