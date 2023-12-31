import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email must not be empty";
    }

    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Password must not be empty";
    }

    return null;
  }

  void onSubmitLogin() {
    formKey.value.currentState!.save();

    if (!formKey.value.currentState!.validate()) {
      return;
    }
  }

  void onNavigateToRegister() {
    Get.offAllNamed(Routes.REGISTER);
  }
}
