import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/data/services/local_service.dart';
import 'package:nusantara_infrastructure_application_test/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    if (LocalService.read(key: "token") != null) {
      Future.delayed(const Duration(milliseconds: 200), () {
        Get.offAllNamed(Routes.HOME);
      });
      return;
    }

    Get.offAllNamed(Routes.LOGIN);
  }
}
