// To parse this JSON data, do
//
//     final createTrainerResponse = createTrainerResponseFromMap(jsonString);

import 'dart:convert';

import '../trainer_model.dart';

class CreateTrainerResponse {
  CreateTrainerResponse({
    required this.user,
    required this.jwt,
  });

  Trainer user;
  String jwt;

  CreateTrainerResponse copyWith({
    Trainer? user,
    String? jwt,
  }) =>
      CreateTrainerResponse(
        user: user ?? this.user,
        jwt: jwt ?? this.jwt,
      );

  factory CreateTrainerResponse.fromJson(String str) =>
      CreateTrainerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateTrainerResponse.fromMap(Map<String, dynamic> json) =>
      CreateTrainerResponse(
        user: Trainer.fromMap(json["user"]),
        jwt: json["jwt"],
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "jwt": jwt,
      };
}
