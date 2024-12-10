import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../models/food_response.dart';

class DashboardRepository {
  DashboardRepository._();

  static APIManager apiManager = APIManager();

  static Future<FoodResponse> getRecommendedDish() async {
    try {
      var response = await apiManager.getAPICall(
        url: 'api/without-login/masters/all-recommended-dishes',
      );
      debugPrint("-----------------------> REPo");
      debugPrint("Response: ${response.toString()}");
      FoodResponse recommendedDishModel = FoodResponse.fromJson(response);
      return recommendedDishModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
