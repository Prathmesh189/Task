import 'package:flutter/cupertino.dart';
import 'package:flutter_p/models/addminise_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/food_response.dart';
import '../repository/dashboard_repositiory.dart';

class DashboardController extends GetxController {
  // Observables
  var itemCounts = <int>[].obs;
  RxList<RxBool> showAddButtonList = RxList<RxBool>();
  final quantity = RxInt(0);
  var recommendations = <Data>[].obs;
  var cartItems = <Datum>[].obs;
  var totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("DashboardController initialized");
    fetchCartDishes();
    fetchRecommendedDishes();
  }

  void incrementQuantity(int index) {
    cartItems[index].cartDetails[0].quantity++;
    calculateTotalPrice();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].cartDetails[0].quantity > 1) {
      cartItems[index].cartDetails[0].quantity--;
      calculateTotalPrice();
    }
  }

  void calculateTotalPrice() {
    totalPrice.value = cartItems.fold(
      0,
      (sum, item) =>
          sum +
          item.cartDetails.fold(
            0,
            (detailSum, detail) => detailSum + (detail.quantity * int.parse(detail.dish.price)),
          ),
    );
  }

  Future<void> fetchCartDishes() async {
    try {
      FoodResponse recommendedDishModel = await DashboardRepository.getRecommendedDishApi();
      if (recommendedDishModel.success!) {
        cartItems.value = cartItems;

        print("---------------------->  ${recommendations.length} ");
        print(recommendations.length);
      } else {
        debugPrint("Failed to fetch recommendations: ${recommendedDishModel.message}");
      }
    } catch (e) {
      debugPrint("Error fetching recommendations: $e");
    }
  }

  Future<void> fetchRecommendedDishes() async {
    try {
      FoodResponse recommendedDishModel = await DashboardRepository.getRecommendedDishApi();
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

  Future<bool> updateItemQuantity({required int restaurent_id, required int id, required String type, bool showLoading = false}) async {
    try {
      Map<String, dynamic> paras = {'restaurent_id': restaurent_id, "dishe_id": id, 'type': type};

      AddminiseModel addminiseModel = await DashboardRepository.addmisueDishesApi(params: paras, showLoading: showLoading);

      if (addminiseModel.success == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Error during API call: ${e.toString()}');
      return false;
    }
  }
}
