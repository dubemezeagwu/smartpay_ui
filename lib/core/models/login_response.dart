// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  final bool status;
  final String message;
  final LoginData data;
  final List<dynamic> meta;
  final List<dynamic> pagination;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    message: json["message"],
    data: LoginData.fromJson(json["data"]),
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    pagination: List<dynamic>.from(json["pagination"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "pagination": List<dynamic>.from(pagination.map((x) => x)),
  };
}

class LoginData {
  LoginData({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.fullName,
    this.username,
    required this.email,
    this.phone,
    this.phoneCountry,
    required this.country,
    this.avatar,
  });

  final String id;
  final String fullName;
  final String? username;
  final String email;
  final dynamic phone;
  final dynamic phoneCountry;
  final String country;
  final dynamic avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["full_name"],
    username: json["username"] ?? "",
    email: json["email"],
    phone: json["phone"] ?? "",
    phoneCountry: json["phone_country"] ?? "",
    country: json["country"],
    avatar: json["avatar"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    if(username != null) "username": username,
    "email": email,
    if(phone != null) "phone": phone,
    if(phoneCountry != null) "phone_country": phoneCountry,
    "country": country,
    if(avatar != null) "avatar": avatar,
  };
}
