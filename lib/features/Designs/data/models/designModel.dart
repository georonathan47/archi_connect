// To parse this JSON data, do
//
//     final designModel = designModelFromJson(jsonString);

import 'dart:convert';

DesignModel designModelFromJson(String str) => DesignModel.fromJson(json.decode(str));

String designModelToJson(DesignModel data) => json.encode(data.toJson());

class DesignModel {
  DesignModel({
    this.id,
    this.title,
    this.owner,
    this.description,
    this.image,
    this.price,
  });

  int? id;
  String? title;
  String? owner;
  String? description;
  String? image;
  int? price;

  factory DesignModel.fromJson(Map<String, dynamic> json) => DesignModel(
        id: json["id"],
        title: json["title"],
        owner: json["owner"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "owner": owner,
        "description": description,
        "image": image,
        "price": price,
      };
}
