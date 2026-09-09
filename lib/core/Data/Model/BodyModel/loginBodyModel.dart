// To parse this JSON data, do
//
//     final loginBodyModel = loginBodyModelFromJson(jsonString);

import 'dart:convert';

LoginBodyModel loginBodyModelFromJson(String str) => LoginBodyModel.fromJson(json.decode(str));

String loginBodyModelToJson(LoginBodyModel data) => json.encode(data.toJson());

class LoginBodyModel {
    String? login;
    String? password;

    LoginBodyModel({
        this.login,
        this.password,
    });

    factory LoginBodyModel.fromJson(Map<String, dynamic> json) => LoginBodyModel(
        login: json["login"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
    };
}
