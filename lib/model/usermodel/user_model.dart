// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    Data data;
    dynamic message;
    dynamic meta;
    dynamic errors;
    String status;

    UserModel({
        required this.data,
        required this.message,
        required this.meta,
        required this.errors,
        required this.status,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        meta: json["meta"],
        errors: json["errors"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "meta": meta,
        "errors": errors,
        "status": status,
    };
}

class Data {
    int expiresIn;
    String accessToken;
    String refreshToken;
    User user;

    Data({
        required this.expiresIn,
        required this.accessToken,
        required this.refreshToken,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        expiresIn: json["expiresIn"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "expiresIn": expiresIn,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String username;
    String email;
    List<Role> roles;

    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    };
}

class Role {
    int createdBy;
    dynamic updatedBy;
    int id;
    String roleName;

    Role({
        required this.createdBy,
        required this.updatedBy,
        required this.id,
        required this.roleName,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        id: json["id"],
        roleName: json["roleName"],
    );

    Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "id": id,
        "roleName": roleName,
    };
}
