// To parse this JSON data, do
//
//     final createPaymentResponse = createPaymentResponseFromMap(jsonString);

import 'dart:convert';

class CreatePaymentResponse {
  CreatePaymentResponse({
    required this.payment,
  });

  Pago payment;

  factory CreatePaymentResponse.fromJson(String str) =>
      CreatePaymentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePaymentResponse.fromMap(Map<String, dynamic> json) =>
      CreatePaymentResponse(
        payment: Pago.fromMap(json["payment"]),
      );

  Map<String, dynamic> toMap() => {
        "payment": payment.toMap(),
      };
}

class Pago {
  Pago({
    required this.datetime,
    required this.days,
    required this.amount,
    required this.client,
    required this.comment,
    required this.discount,
    required this.status,
    required this.id,
    required this.v,
  });

  String datetime;
  int days;
  int amount;
  String client;
  String comment;
  int discount;
  bool status;
  String id;
  int v;

  factory Pago.fromJson(String str) => Pago.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pago.fromMap(Map<String, dynamic> json) => Pago(
        datetime: json["datetime"],
        days: json["days"],
        amount: json["amount"],
        client: json["client"],
        comment: json["comment"],
        discount: json["discount"],
        status: json["status"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "datetime": datetime,
        "days": days,
        "amount": amount,
        "client": client,
        "comment": comment,
        "discount": discount,
        "status": status,
        "_id": id,
        "__v": v,
      };
}
