// To parse this JSON data, do
//
//     final createPaymentResponse = createPaymentResponseFromMap(jsonString);

import 'dart:convert';

import 'package:gym/models/models.dart';

class AllPaymentsByID {
  AllPaymentsByID({
    required this.id,
    required this.datetime,
    required this.days,
    required this.amount,
    required this.client,
    required this.comment,
    required this.discount,
    required this.status,
    required this.v,
  });

  String id;
  String datetime;
  int days;
  int amount;
  User client;
  String comment;
  int discount;
  bool status;
  int v;

  factory AllPaymentsByID.fromJson(String str) =>
      AllPaymentsByID.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllPaymentsByID.fromMap(Map<String, dynamic> json) => AllPaymentsByID(
        id: json["_id"],
        datetime: json["datetime"],
        days: json["days"],
        amount: json["amount"],
        client: User.fromMap(json["client"]),
        comment: json["comment"],
        discount: json["discount"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "datetime": datetime,
        "days": days,
        "amount": amount,
        "client": client.toMap(),
        "comment": comment,
        "discount": discount,
        "status": status,
        "__v": v,
      };
}
