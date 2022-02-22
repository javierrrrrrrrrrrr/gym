import 'dart:convert';

import 'package:gym/models/users_model.dart';

class GetUsersResponse {
  GetUsersResponse({
    required this.clients,
  });

  List<User> clients;

  GetUsersResponse copyWith({
    List<User>? clients,
  }) =>
      GetUsersResponse(
        clients: clients ?? this.clients,
      );

  factory GetUsersResponse.fromJson(String str) =>
      GetUsersResponse.fromMap(json.decode(str));

  factory GetUsersResponse.fromMap(Map<String, dynamic> json) =>
      GetUsersResponse(
        clients: List<User>.from(json["clients"].map((x) => User.fromMap(x))),
      );
}
