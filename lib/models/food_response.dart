class FoodResponse {
  bool? success;
  int? code;
  List<Data>? data;
  String? message;

  FoodResponse({this.success, this.code, this.data, this.message});

  FoodResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null && json['data'] is List) {
      data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();
    } else {
      data = [];
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  String? coverImage;
  String? time;
  String? description;
  String? price;
  String? adminPrice;
  String? packagingCharges;
  int? discount;
  String? vote;
  int? customizeSpice;
  int? freeDelivery;
  int? bestSeller;
  int? recommended;
  int? acceptReject;
  int? status;
  int? userId;

  Data({
    this.id,
    this.name,
    this.image,
    this.coverImage,
    this.time,
    this.description,
    this.price,
    this.adminPrice,
    this.packagingCharges,
    this.discount,
    this.vote,
    this.customizeSpice,
    this.freeDelivery,
    this.bestSeller,
    this.recommended,
    this.acceptReject,
    this.status,
    this.userId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    coverImage = json['cover_image'];
    time = json['time'];
    description = json['description'];
    price = json['price'];
    adminPrice = json['admin_price'];
    packagingCharges = json['packaging_charges'];
    discount = json['discount'];
    vote = json['vote'];
    customizeSpice = json['customize_spice'];
    freeDelivery = json['free_delivery'];
    bestSeller = json['best_seller'];
    recommended = json['recommended'];
    acceptReject = json['accept_reject'];
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['cover_image'] = this.coverImage;
    data['time'] = this.time;
    data['description'] = this.description;
    data['price'] = this.price;
    data['admin_price'] = this.adminPrice;
    data['packaging_charges'] = this.packagingCharges;
    data['discount'] = this.discount;
    data['vote'] = this.vote;
    data['customize_spice'] = this.customizeSpice;
    data['free_delivery'] = this.freeDelivery;
    data['best_seller'] = this.bestSeller;
    data['recommended'] = this.recommended;
    data['accept_reject'] = this.acceptReject;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    return data;
  }
}
