import 'dart:convert';
import 'models.dart';

User userModel(String str) => User.fromJson(json.decode(str));

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.age,
    required this.role,
    required this.lottery,
    required this.ticket,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String gender;
  late final int age;
  late final String role;
  late final List<Lottery> lottery;
  late final List<Ticket> ticket;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    role = json['role'];
    lottery =
        List.from(json['lotteries']).map((e) => Lottery.fromJson(e)).toList();
    ticket = List.from(json['tickets']).map((e) => Ticket.fromJson(e)).toList();
  }
}
