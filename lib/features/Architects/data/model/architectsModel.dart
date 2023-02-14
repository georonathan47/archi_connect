// To parse this JSON data, do
//
//     final architectModel = architectModelFromJson(jsonString);

import 'dart:convert';

ArchitectModel architectModelFromJson(String str) => ArchitectModel.fromJson(json.decode(str));

String architectModelToJson(ArchitectModel data) => json.encode(data.toJson());

class ArchitectModel {
  ArchitectModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.experience,
    this.ratings,
    this.image,
  });

  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? password;
  int? experience;
  double? ratings;
  dynamic image;

  factory ArchitectModel.fromJson(Map<String, dynamic> json) => ArchitectModel(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        experience: json["experience"],
        ratings: json["ratings"]?.toDouble(),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "experience": experience,
        "ratings": ratings,
        "image": image,
      };
}
