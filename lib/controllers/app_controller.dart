import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../api/api_manager.dart';
import '../utils/connection.dart';

class AppController extends GetxController {
  final Connection connection = Connection();
  StreamSubscription<bool>? connectionSubscription;
  String? userToken;

  @override
  void onInit() async {
    userToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjozLCJpYXQiOjE3MjY3Mzk3MzIsImV4cCI6MTc1ODI3NTczMn0.12s9mY9zh0yNlEA2UD4zFvr_uE4_RzK9pqqbumS5IsA';
    super.onInit();
    // Initialize network service

    // Initialize api manager
    APIManager.init(this);

    await initializeConnectionServices();
  }

  Future<void> initializeConnectionServices() async {
    connection.initValue = await Connection.checkInternet();
    connectionSubscription = connection.onChangeConnectivity.listen((event) {
      APIManager.init(this);
      debugPrint('Has internet $event');
    });
  }
}
