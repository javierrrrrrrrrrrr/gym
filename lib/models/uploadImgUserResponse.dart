import 'dart:convert';

class UploadImagenUserResponse {
  UploadImagenUserResponse({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.height,
    required this.weight,
    required this.email,
    required this.datetime,
    required this.phone,
    required this.imc,
    required this.icc,
    required this.services,
    required this.status,
    required this.payments,
    required this.observations,
    required this.trainer,
    required this.img,
    required this.servicedays,
    required this.v,
    required this.active,
    required this.activeto,
  });

  String id;
  String firstname;
  String lastname;
  int age;
  String height;
  String weight;
  String email;
  DateTime datetime;
  String phone;
  String imc;
  String icc;
  List<dynamic> services;
  bool status;
  List<dynamic> payments;
  List<dynamic> observations;
  String trainer;
  String img;
  int servicedays;
  int v;
  bool active;
  String activeto;

  factory UploadImagenUserResponse.fromJson(String str) =>
      UploadImagenUserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadImagenUserResponse.fromMap(Map<String, dynamic> json) =>
      UploadImagenUserResponse(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        email: json["email"],
        datetime: DateTime.parse(json["datetime"]),
        phone: json["phone"],
        imc: json["imc"],
        icc: json["icc"],
        services: List<dynamic>.from(json["services"].map((x) => x)),
        status: json["status"],
        payments: List<dynamic>.from(json["payments"].map((x) => x)),
        observations: List<dynamic>.from(json["observations"].map((x) => x)),
        trainer: json["trainer"],
        img: json["img"],
        servicedays: json["servicedays"],
        v: json["__v"],
        active: json["active"],
        activeto: json["activeto"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "height": height,
        "weight": weight,
        "email": email,
        "datetime": datetime.toIso8601String(),
        "phone": phone,
        "imc": imc,
        "icc": icc,
        "services": List<dynamic>.from(services.map((x) => x)),
        "status": status,
        "payments": List<dynamic>.from(payments.map((x) => x)),
        "observations": List<dynamic>.from(observations.map((x) => x)),
        "trainer": trainer,
        "img": img,
        "servicedays": servicedays,
        "__v": v,
        "active": active,
        "activeto": activeto,
      };
}
