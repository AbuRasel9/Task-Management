// To parse this JSON data, do
//
//     final signUpRequest = signUpRequestFromJson(jsonString);

import 'dart:convert';

SignUpRequest signUpRequestFromJson(String str) => SignUpRequest.fromJson(json.decode(str));

String signUpRequestToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? password;
  String? photo;

  SignUpRequest({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.password,
    this.photo,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobile: json["mobile"],
    password: json["password"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "password": password,
    "photo": photo,
  };
}
