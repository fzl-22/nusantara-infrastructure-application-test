import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nusantara_infrastructure_application_test/app/constants/theme.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/splash/bindings/splash_binding.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/splash/controllers/splash_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  Get.put(SplashController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Application",
      theme: AppTheme.THEME,
      initialRoute: AppPages.INITIAL,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,

    ),
  );
}
