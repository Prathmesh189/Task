import 'package:flutter/material.dart';
import 'package:flutter_p/models/cart_model.dart';

import '../api/api_manager.dart';
import '../models/addminise_model.dart';
import '../models/food_response.dart';

class DashboardRepository {
  DashboardRepository._();

  static APIManager apiManager = APIManager();

  static Future<CartModel> getUserCartApi() async {
    try {
      var response = await apiManager.getAPICall(
        url: '/api/user/cart',
      );
      debugPrint("-----------------------> REPO");
      debugPrint("Response: ${response.toString()}");
      CartModel cartModel = CartModel.fromJson(response);
      return cartModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<FoodResponse> getRecommendedDishApi() async {
    try {
      var response = await apiManager.getAPICall(
        url: '/api/without-login/masters/all-recommended-dishes',
      );
      debugPrint("-----------------------> REPO");
      debugPrint("Response: ${response.toString()}");
      FoodResponse recommendedDishModel = FoodResponse.fromJson(response);
      return recommendedDishModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<AddminiseModel> addmisueDishesApi({required dynamic params, bool showLoading = false}) async {
    try {
      var response = await apiManager.postAPICall(
        url: '/api/user/cart/quantity',
        params: params,
        showLoading: showLoading,
      );
      AddminiseModel rechargeMoneyModel = AddminiseModel.fromJson(response);
      return rechargeMoneyModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
