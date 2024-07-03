// To parse this JSON data, do
//
//     final blockModel = blockModelFromJson(jsonString);

import 'dart:convert';

BlockModel blockModelFromJson(String str) => BlockModel.fromJson(json.decode(str));

String blockModelToJson(BlockModel data) => json.encode(data.toJson());

class BlockModel {
    List<Datum> data;
    dynamic message;
    dynamic meta;
    dynamic errors;
    String status;

    BlockModel({
        required this.data,
        required this.message,
        required this.meta,
        required this.errors,
        required this.status,
    });

    factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        meta: json["meta"],
        errors: json["errors"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "meta": meta,
        "errors": errors,
        "status": status,
    };
}

class Datum {
    int menuId;
    String menuName;
    int subMenuId;
    String subMenuName;
    String blockType;
    double? price;

    Datum({
        required this.menuId,
        required this.menuName,
        required this.subMenuId,
        required this.subMenuName,
        required this.blockType,
        required this.price,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        menuId: json["menuId"],
        menuName: json["menuName"],
        subMenuId: json["subMenuId"],
        subMenuName: json["subMenuName"],
        blockType: json["blockType"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "menuId": menuId,
        "menuName": menuName,
        "subMenuId": subMenuId,
        "subMenuName": subMenuName,
        "blockType": blockType,
        "price": price,
    };
}
