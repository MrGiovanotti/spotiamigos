// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    this.id,
    this.name,
    this.firstMonthCompleted,
    this.lastPaymentDate,
    this.debt,
  });

  int id;
  String name;
  DateTime firstMonthCompleted;
  DateTime lastPaymentDate;
  double debt;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        firstMonthCompleted: DateTime.parse(json["firstMonthCompleted"]),
        lastPaymentDate: DateTime.parse(json["lastPaymentDate"]),
        debt: json["debt"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstMonthCompleted":
            "${firstMonthCompleted.year.toString().padLeft(4, '0')}-${firstMonthCompleted.month.toString().padLeft(2, '0')}-${firstMonthCompleted.day.toString().padLeft(2, '0')}",
        "lastPaymentDate":
            "${lastPaymentDate.year.toString().padLeft(4, '0')}-${lastPaymentDate.month.toString().padLeft(2, '0')}-${lastPaymentDate.day.toString().padLeft(2, '0')}",
        "debt": debt,
      };
}
