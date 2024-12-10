import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

class Loader {
  static final Loader _loader = Loader._init();
  Loader._init() {
    _initiateEasyLoading();
  }
  bool isLoadedActive = false;

  void _initiateEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      // ..customAnimation = CustomAnimation()
      ..dismissOnTap = false;
  }

  static Loader get instance => _loader;

  void showLoader() {
    EasyLoading.show();
    // if (EasyLoading.isShow) {}
  }

  void removeLoader() {
    EasyLoading.dismiss();
    // if (isLoadedActive) {
    //   Get.back();
    //   isLoadedActive = false;
    // }
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.bouncingBall(
        color: Theme.of(context).colorScheme.primary,
        size: 50.w,
      ),
    );
  }
}
