class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.age,
    required this.role,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String phone;
  late final String gender;
  late final int age;
  late final String role;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['gender'] = gender;
    _data['age'] = age;
    _data['role'] = role;
    return _data;
  }
}
