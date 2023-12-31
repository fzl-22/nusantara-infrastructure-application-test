import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Center(
        child: SizedBox(
          height: 36,
          width: 36,
          child: CircularProgressIndicator(
            color: Get.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
