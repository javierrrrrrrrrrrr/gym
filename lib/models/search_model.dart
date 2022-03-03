import 'dart:convert';

import 'package:gym/models/models.dart';

class SearchModel {
  SearchModel({
    required this.clientes,
  });

  List<User> clientes;

  factory SearchModel.fromJson(String str) =>
      SearchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        clientes: List<User>.from(json["results"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(clientes.map((x) => x.toMap())),
      };
}
