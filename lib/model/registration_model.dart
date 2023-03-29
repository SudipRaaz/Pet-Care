// To parse this JSON data, do
//
//     final registration = registrationFromJson(jsonString);

import 'dart:convert';

Registration_Model registrationFromJson(String str) =>
    Registration_Model.fromJson(json.decode(str));

String registrationToJson(Registration_Model data) =>
    json.encode(data.toJson());

class Registration_Model {
  Registration_Model({
    required this.petOwnerName,
    required this.email,
    required this.petName,
    required this.petType,
    required this.dogBreed,
    required this.catBreed,
    required this.petGender,
    required this.age,
    required this.petWeight,
  });

  String petOwnerName;
  String email;
  String petName;
  String petType;
  String dogBreed;
  String catBreed;
  String petGender;
  int age;
  double petWeight;

  factory Registration_Model.fromJson(Map<String, dynamic> json) =>
      Registration_Model(
        petOwnerName: json["PetOwnerName"],
        email: json["Email"],
        petName: json["PetName"],
        petType: json["PetType"],
        dogBreed: json["DogBreed"],
        catBreed: json["CatBreed"],
        petGender: json["PetGender"],
        age: json["Age"] as int,
        petWeight: json["PetWeight"] as double,
      );

  Map<String, dynamic> toJson() => {
        "PetOwnerName": petOwnerName,
        "Email": email,
        "PetName": petName,
        "PetType": petType,
        "DogBreed": dogBreed,
        "CatBreed": catBreed,
        "PetGender": petGender,
        "Age": age,
        "PetWeight": petWeight,
      };
}
