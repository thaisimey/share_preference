

import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));
String UserToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String photo;
  String gender;
  String username;
  String password;

  User({this.id, this.name, this.photo, this.gender, this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    gender: json["gender"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
    "gender": gender,
    "username": username,
    "password": password,
  };

}

