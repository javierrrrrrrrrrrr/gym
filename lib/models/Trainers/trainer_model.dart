import 'dart:convert';

class Trainer {
  Trainer({
    required this.name,
    required this.email,
    this.img,
    this.rol,
    this.status,
    this.uid,
  });

  String name;
  String email;
  String? img;
  String? rol;
  bool? status;
  String? uid;

  Trainer copyWith({
    String? name,
    String? email,
    String? img,
    String? rol,
    bool? status,
    String? uid,
  }) =>
      Trainer(
        name: name ?? this.name,
        email: email ?? this.email,
        img: img ?? this.img,
        rol: rol ?? this.rol,
        status: status ?? this.status,
        uid: uid ?? this.uid,
      );

  factory Trainer.fromJson(String str) => Trainer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Trainer.fromMap(Map<String, dynamic> json) => Trainer(
        name: json["name"],
        email: json["email"],
        img: json["img"],
        rol: json["rol"],
        status: json["status"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "img": img,
        "rol": rol,
        "status": status,
        "uid": uid,
      };
}
