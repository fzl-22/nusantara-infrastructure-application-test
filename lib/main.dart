import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/constants/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Application",
      theme: AppTheme.THEME,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
