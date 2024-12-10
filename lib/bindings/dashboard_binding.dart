import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
    Get.lazyPut(() => DashboardController());
  }
}
