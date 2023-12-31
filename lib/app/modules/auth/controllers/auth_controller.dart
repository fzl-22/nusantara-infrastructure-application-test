import 'package:get/get.dart';

class AuthController extends GetxController {
  final isAuthenticated = false.obs;

  void getErrorDialog({required String message}) {
    Get.defaultDialog(
      title: "An error occured",
      middleText: message,
    );
  }

  void login({required String email, required String password}) {
    
  }
}
