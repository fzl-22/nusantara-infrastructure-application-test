import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email must not be empty";
    }

    if (!email.isEmail) {
      return "Email must be valid";
    }

    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Password must not be empty";
    }

    if (password.length < 8 || password.length > 16) {
      return "Password must be between 8 and 16 characters";
    }

    if (password.isAlphabetOnly || password.isNumericOnly) {
      return "Password must be alphanumeric";
    }

    return null;
  }

  String? confirmPasswordValidator(String? confirmedPassword) {
    if (confirmedPassword == null || confirmedPassword.isEmpty) {
      return "Confirmed password must not be empty";
    }

    if (confirmedPassword != passwordController.value.text) {
      return "Passwords not matched";
    }

    return null;
  }

  void onSubmitRegister() {
    formKey.value.currentState!.save();

    if (!formKey.value.currentState!.validate()) {
      return;
    }
  }

  void onNavigateToLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
