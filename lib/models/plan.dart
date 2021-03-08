// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    this.id,
    this.price,
    this.iva,
  });

  int id;
  double price;
  double iva;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        price: json["price"].toDouble(),
        iva: json["iva"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "iva": iva,
      };
}
