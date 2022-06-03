import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  final bool status;
  final String message;
  final RegisterData data;
  final List<dynamic> meta;
  final List<dynamic> pagination;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    status: json["status"],
    message: json["message"],
    data: RegisterData.fromJson(json["data"]),
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

class RegisterData {
  RegisterData({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
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
    required this.fullName,
    required this.username,
    required this.email,
    required this.country,
    required this.id,
  });

  final String fullName;
  final String username;
  final String email;
  final String country;
  final String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json["full_name"],
    username: json["username"],
    email: json["email"],
    country: json["country"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "username": username,
    "email": email,
    "country": country,
    "id": id,
  };
}
