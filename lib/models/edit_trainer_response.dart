// To parse this JSON data, do
//
//     final createTrainerResponse = createTrainerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:gym/models/trainer_model.dart';

class EditTrainerResponse {
  EditTrainerResponse({
    required this.client,
  });

  Trainer client;

  EditTrainerResponse copyWith({
    Trainer? client,
  }) =>
      EditTrainerResponse(
        client: client ?? this.client,
      );

  factory EditTrainerResponse.fromJson(String str) =>
      EditTrainerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditTrainerResponse.fromMap(Map<String, dynamic> json) =>
      EditTrainerResponse(
        client: Trainer.fromMap(json["client"]),
      );

  Map<String, dynamic> toMap() => {
        "client": client.toMap(),
      };
}
