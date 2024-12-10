import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'bindings/app_binding.dart';
import 'routes/app_pages.dart';
import 'utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          initialRoute: AppPages.initialRoute,
          getPages: AppPages.routes,
          title: Config.appName,
          defaultTransition: AppPages.transition,
        );
      },
    );
  }
}
