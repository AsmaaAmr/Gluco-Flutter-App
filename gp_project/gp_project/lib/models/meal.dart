import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Meal contactFromJson(String str) {
  final jsonData = json.decode(str);
  return Meal.fromJson(jsonData);
}

String userToJson(Meal data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Meal {
  String id;
  String food;
  String quantity;
  String carb;
  String suger;
  String timestamp;
  int userId;

  Meal(
      {this.id,this.food,this.quantity,this.carb,this.suger,this.timestamp,this.userId});

  Map<String, dynamic> toJson() => {
        "id": id,
        "food": food,
        "quantity": quantity,
        "carb": carb,
        "suger": suger,
        "TimeStamp": timestamp,
        "PatientId": userId,
      };

  factory Meal.fromJson(Map<String, dynamic> json) => new Meal(
        id: json["id"],
        food: json["message"],
        quantity: json["quantity"],
        carb: json["carb"],
        suger: json["suger"],
        timestamp: json["TimeStamp"],
        userId: json["PatientId"],
      );

  factory Meal.fromDocument(DocumentSnapshot doc) {
    return Meal.fromJson(doc.data);
  }
}
