import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/food_response.dart';
import '../repository/dashboard_repositiory.dart';

class DashboardController extends GetxController {
  // Observables
  var itemCounts = <int>[].obs;
  var recommendations = <Data>[].obs;
  RxList<RxBool> showAddButtonList = RxList<RxBool>();

  @override
  void onInit() {
    super.onInit();
    print("DashboardController initialized");
    fetchRecommendedDishes();
  }

  Future<void> fetchRecommendedDishes() async {
    try {
      FoodResponse recommendedDishModel = await DashboardRepository.getRecommendedDish();
      if (recommendedDishModel.success!) {
        recommendations.value = recommendedDishModel.data!;

        print("---------------------->  ${recommendations.length} ");
        print(recommendations.length);
      } else {
        debugPrint("Failed to fetch recommendations: ${recommendedDishModel.message}");
      }
    } catch (e) {
      debugPrint("Error fetching recommendations: $e");
    }
  }
}
