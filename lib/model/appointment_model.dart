// To parse this JSON data, do
//
//     final appointmentBooking = appointmentBookingFromJson(jsonString);

import 'dart:convert';

Appointment_Model appointmentBookingFromJson(String str) =>
    Appointment_Model.fromJson(json.decode(str));

String appointmentBookingToJson(Appointment_Model data) =>
    json.encode(data.toJson());

class Appointment_Model {
  Appointment_Model({
    required this.date,
    required this.time,
    required this.type,
    required this.location,
    required this.uid,
    required this.status,
  });

  DateTime date;
  String time;
  String type;
  String location;
  String uid;
  String status;

  factory Appointment_Model.fromJson(Map<String, dynamic> json) =>
      Appointment_Model(
          date: json["Date"] as DateTime,
          time: json["Time"],
          type: json["Type"],
          location: json["Location"],
          uid: json["uid"],
          status: json["Status"]);

  Map<String, dynamic> toJson() => {
        "Date": date,
        "Time": time,
        "Type": type,
        "Location": location,
        "uid": uid,
        "Status": status
      };
}
