import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

Doctor doctorFromJson(String str) {
  final jsonData = json.decode(str);
  return Doctor.fromJson(jsonData);
}

String doctorToJson(Doctor data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

setSearchParam(String name) {
  List<String> caseSearchList = List();
  String temp = "";
  for (int i = 0; i < name.length; i++) {
    temp = temp + name[i].toLowerCase();
    caseSearchList.add(temp);
  }
  return caseSearchList;
}

class Doctor {
  String dId;
  String name;
  String email;
  String password;
  String phone;
  String clinicno;
  String university;
  String address1;
  String address2;
  String region;
  String role;
  File photo;

  Doctor({
    this.dId,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.clinicno,
    this.university,
    this.address1,
    this.address2,
    this.role,
    this.photo,
    this.region,
  });
  Map<String, dynamic> toJson() => {
        "id": dId,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "clinicno.": clinicno,
        "university": university,
        "address1": address1,
        "address2": address2,
        "photo":photo,
        "role": 'doctor',
        "SearchIndex": setSearchParam(name),
        "clinicRegion":region
      };
  factory Doctor.fromJson(Map<String, dynamic> json) => new Doctor(
        dId: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        clinicno: json["clinicno."],
        university: json["university"],
        address1: json["address1"],
        address2: json["address2"],
        photo: json["photo"],
        role: json["doctor"],
        region: json["clinicRegion"]
      );
  factory Doctor.fromDocument(DocumentSnapshot doc) {
    return Doctor.fromJson(doc.data);
  }
}
class DoctorList{
  List<Doctor> doctorList;

  DoctorList({this.doctorList});
}
