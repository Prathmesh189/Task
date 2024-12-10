import 'package:flutter_p/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../bindings/dashboard_binding.dart';
import '../screens/cart_screen.dart';
import '../screens/dashboard_screen.dart';

class AppPages {
  AppPages._();

  static const Transition transition = Transition.native;

  static const String initialRoute = Routes.DASHBOARD_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.DASHBOARD_SCREEN,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
      transition: transition,
    ),
    GetPage(
      name: Routes.CART_SCREEN,
      page: () => CartScreen(),
      binding: DashboardBinding(),
      transition: transition,
    ),
  ];
}
