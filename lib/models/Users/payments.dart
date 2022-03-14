// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromMap(jsonString);

import 'dart:convert';

import 'package:gym/models/models.dart';

class Payment {
  Payment({
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

  factory Payment.fromJson(String str) => Payment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payment.fromMap(Map<String, dynamic> json) => Payment(
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
