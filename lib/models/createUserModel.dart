// ignore_for_file: file_names

import 'package:gym/models/models.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class CreateUserResponse {
  CreateUserResponse({
    @required this.client,
  });

  User? client;

  CreateUserResponse copyWith({
    User? client,
  }) =>
      CreateUserResponse(
        client: client ?? this.client,
      );

  factory CreateUserResponse.fromJson(String str) =>
      CreateUserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateUserResponse.fromMap(Map<String, dynamic> json) =>
      CreateUserResponse(
        client: User.fromMap(json["client"]),
      );

  Map<String, dynamic> toMap() => {
        "client": client!.toMap(),
      };
}
