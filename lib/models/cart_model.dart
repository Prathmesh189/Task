import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  int code;
  List<Datum> data;
  bool success;
  String message;

  factory CartModel.fromJson(Map<dynamic, dynamic> json) => CartModel(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class Datum {
  Datum({
    required this.createdAt,
    required this.userId,
    required this.restaurentId,
    required this.cartDetails,
    required this.id,
    required this.dishesCount,
    required this.restaurent,
    required this.status,
    required this.updatedAt,
  });

  DateTime createdAt;
  int userId;
  int restaurentId;
  List<CartDetail> cartDetails;
  int id;
  int dishesCount;
  Restaurent restaurent;
  int status;
  DateTime updatedAt;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        createdAt: DateTime.parse(json["createdAt"]),
        userId: json["user_id"],
        restaurentId: json["restaurent_id"],
        cartDetails: List<CartDetail>.from(json["cart_details"].map((x) => CartDetail.fromJson(x))),
        id: json["id"],
        dishesCount: json["dishes_count"],
        restaurent: Restaurent.fromJson(json["restaurent"]),
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "user_id": userId,
        "restaurent_id": restaurentId,
        "cart_details": List<dynamic>.from(cartDetails.map((x) => x.toJson())),
        "id": id,
        "dishes_count": dishesCount,
        "restaurent": restaurent.toJson(),
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class CartDetail {
  CartDetail({
    required this.createdAt,
    required this.cartId,
    required this.quantity,
    required this.disheId,
    required this.userId,
    required this.dish,
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
  Dish dish;
  int restaurentId;
  int id;
  int customizeSpice;
  int status;
  DateTime updatedAt;

  factory CartDetail.fromJson(Map<dynamic, dynamic> json) => CartDetail(
        createdAt: DateTime.parse(json["createdAt"]),
        cartId: json["cart_id"],
        quantity: json["quantity"],
        disheId: json["dishe_id"],
        userId: json["user_id"],
        dish: Dish.fromJson(json["dish"]),
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
        "dish": dish.toJson(),
        "restaurent_id": restaurentId,
        "id": id,
        "customize_spice": customizeSpice,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Dish {
  Dish({
    required this.packagingCharges,
    required this.image,
    required this.bestSeller,
    required this.acceptReject,
    required this.foodTypeId,
    required this.description,
    required this.discount,
    required this.customizeSpice,
    required this.recommended,
    required this.createdAt,
    required this.categoryId,
    required this.userId,
    required this.price,
    required this.restaurentId,
    required this.name,
    required this.adminPrice,
    required this.freeDelivery,
    required this.id,
    required this.coverImage,
    required this.time,
    required this.vote,
    required this.status,
    required this.updatedAt,
  });

  String packagingCharges;
  String image;
  int bestSeller;
  int acceptReject;
  int foodTypeId;
  String description;
  int discount;
  int customizeSpice;
  int recommended;
  DateTime createdAt;
  int categoryId;
  int userId;
  String price;
  int restaurentId;
  String name;
  String adminPrice;
  int freeDelivery;
  int id;
  String coverImage;
  String time;
  String vote;
  int status;
  DateTime updatedAt;

  factory Dish.fromJson(Map<dynamic, dynamic> json) => Dish(
        packagingCharges: json["packaging_charges"],
        image: json["image"],
        bestSeller: json["best_seller"],
        acceptReject: json["accept_reject"],
        foodTypeId: json["food_type_id"],
        description: json["description"],
        discount: json["discount"],
        customizeSpice: json["customize_spice"],
        recommended: json["recommended"],
        createdAt: DateTime.parse(json["createdAt"]),
        categoryId: json["category_id"],
        userId: json["user_id"],
        price: json["price"],
        restaurentId: json["restaurent_id"],
        name: json["name"],
        adminPrice: json["admin_price"],
        freeDelivery: json["free_delivery"],
        id: json["id"],
        coverImage: json["cover_image"],
        time: json["time"],
        vote: json["vote"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "packaging_charges": packagingCharges,
        "image": image,
        "best_seller": bestSeller,
        "accept_reject": acceptReject,
        "food_type_id": foodTypeId,
        "description": description,
        "discount": discount,
        "customize_spice": customizeSpice,
        "recommended": recommended,
        "createdAt": createdAt.toIso8601String(),
        "category_id": categoryId,
        "user_id": userId,
        "price": price,
        "restaurent_id": restaurentId,
        "name": name,
        "admin_price": adminPrice,
        "free_delivery": freeDelivery,
        "id": id,
        "cover_image": coverImage,
        "time": time,
        "vote": vote,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Restaurent {
  Restaurent({
    required this.image,
    required this.address,
    required this.latitude,
    required this.pincodeId,
    required this.createdAt,
    required this.userId,
    required this.name,
    required this.id,
    required this.stateId,
    required this.landmark,
    required this.countryId,
    required this.longitude,
    required this.status,
    required this.updatedAt,
    required this.cityId,
  });

  String image;
  String address;
  String latitude;
  int pincodeId;
  DateTime createdAt;
  int userId;
  String name;
  int id;
  int stateId;
  String landmark;
  int countryId;
  String longitude;
  int status;
  DateTime updatedAt;
  int cityId;

  factory Restaurent.fromJson(Map<dynamic, dynamic> json) => Restaurent(
        image: json["image"],
        address: json["address"],
        latitude: json["latitude"],
        pincodeId: json["pincode_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        userId: json["user_id"],
        name: json["name"],
        id: json["id"],
        stateId: json["state_id"],
        landmark: json["landmark"],
        countryId: json["country_id"],
        longitude: json["longitude"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        cityId: json["city_id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "image": image,
        "address": address,
        "latitude": latitude,
        "pincode_id": pincodeId,
        "createdAt": createdAt.toIso8601String(),
        "user_id": userId,
        "name": name,
        "id": id,
        "state_id": stateId,
        "landmark": landmark,
        "country_id": countryId,
        "longitude": longitude,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
        "city_id": cityId,
      };
}
