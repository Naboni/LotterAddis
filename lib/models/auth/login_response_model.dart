import 'dart:convert';

LoginResponseModel loginResponseModel(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.gender,
    required this.role,
    required this.phone,
    required this.token,
    required this.expiresIn,
  });
  late final String message;
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final int age;
  late final String gender;
  late final String role;
  late final String phone;
  late final String token;
  late final int expiresIn;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    age = json['age'];
    gender = json['gender'];
    role = json['role'];
    phone = json['phone'];
    token = json['token'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['role'] = role;
    _data['phone'] = phone;
    _data['token'] = token;
    _data['expiresIn'] = expiresIn;
    return _data;
  }
}
