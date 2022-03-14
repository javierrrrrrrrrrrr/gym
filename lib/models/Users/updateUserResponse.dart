// To parse this JSON data, do
//
//     final updateUserResponse = updateUserResponseFromMap(jsonString);

import 'dart:convert';

import 'package:gym/models/models.dart';

class UpdateUserResponse {
  UpdateUserResponse({
    required this.client,
  });

  User client;

  factory UpdateUserResponse.fromJson(String str) =>
      UpdateUserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserResponse.fromMap(Map<String, dynamic> json) =>
      UpdateUserResponse(
        client: User.fromMap(json["client"]),
      );

  Map<String, dynamic> toMap() => {
        "client": client.toMap(),
      };
}
