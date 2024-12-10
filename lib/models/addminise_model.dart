/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

AddminiseModel addminiseModelFromJson(String str) => AddminiseModel.fromJson(json.decode(str));

String addminiseModelToJson(AddminiseModel data) => json.encode(data.toJson());

class AddminiseModel {
  AddminiseModel({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  int code;
  DataC data;
  bool success;
  String message;

  factory AddminiseModel.fromJson(Map<dynamic, dynamic> json) => AddminiseModel(
        code: json["code"],
        data: DataC.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "success": success,
        "message": message,
      };
}

class DataC {
  DataC({
    required this.createdAt,
    required this.cartId,
    required this.quantity,
    required this.disheId,
    required this.userId,
    required this.restaurentId,
    required this.id,
    required this.customizeSpice,
    required this.status,
    required this.updatedAt,
  });

  DateTime createdAt;
  int cartId;
  int quantity;
  int disheId;
  int userId;
  int restaurentId;
  int id;
  int customizeSpice;
  int status;
  DateTime updatedAt;

  factory DataC.fromJson(Map<dynamic, dynamic> json) => DataC(
        createdAt: DateTime.parse(json["createdAt"]),
        cartId: json["cart_id"],
        quantity: json["quantity"],
        disheId: json["dishe_id"],
        userId: json["user_id"],
        restaurentId: json["restaurent_id"],
        id: json["id"],
        customizeSpice: json["customize_spice"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "cart_id": cartId,
        "quantity": quantity,
        "dishe_id": disheId,
        "user_id": userId,
        "restaurent_id": restaurentId,
        "id": id,
        "customize_spice": customizeSpice,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
