// To parse this JSON data, do
//
//     final userLoginFailedModel = userLoginFailedModelFromJson(jsonString);

import 'dart:convert';

UserLoginFailedModel userLoginFailedModelFromJson(String str) => UserLoginFailedModel.fromJson(json.decode(str));

String userLoginFailedModelToJson(UserLoginFailedModel data) => json.encode(data.toJson());

class UserLoginFailedModel {
    String message;
    dynamic errors;
    String status;

    UserLoginFailedModel({
        required this.message,
        required this.errors,
        required this.status,
    });

    factory UserLoginFailedModel.fromJson(Map<String, dynamic> json) => UserLoginFailedModel(
        message: json["message"],
        errors: json["errors"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors,
        "status": status,
    };
}
