// To parse this JSON data, do
//
//     final participant = participantFromJson(jsonString);

import 'dart:convert';

Participant participantFromJson(String str) =>
    Participant.fromJson(json.decode(str));

String participantToJson(Participant data) => json.encode(data.toJson());

class Participant {
  Participant({
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

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
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
