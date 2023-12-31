import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/constants/api_endpoints.dart';
import 'package:nusantara_infrastructure_application_test/app/data/services/network_service.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/error_dialog.dart';
import 'package:nusantara_infrastructure_application_test/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>().obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final passwordConfirmationController = TextEditingController().obs;
  final isLoading = false.obs;

  String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name must not be empty";
    }

    return null;
  }

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

  String? passwordConfirmationValidator(String? passwordConfirmation) {
    if (passwordConfirmation == null || passwordConfirmation.isEmpty) {
      return "Confirmed password must not be empty";
    }

    if (passwordConfirmation != passwordController.value.text) {
      return "Passwords not matched";
    }

    return null;
  }

  void onSubmitRegister() async {
    formKey.value.currentState!.save();

    if (!formKey.value.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> body = {
      "name": nameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "password_confirmation": passwordConfirmationController.value.text,
    };

    setLoader(true);
    try {
      final response = await NetworkService.post(
        endpoint: ApiEndpoints.REGISTER_ENDPOINT,
        body: body,
      );

      if (response['message'] == "The email has already been taken.") {
        Get.dialog(
          const ErrorDialog(
            title: "Email already taken",
            message: "Please register with different email address",
          ),
        );
        return;
      }
    } catch (error) {
      Get.dialog(
        const ErrorDialog(
          title: "Unknown error",
          message: "An unknown error occurred. Please try again later",
        ),
      );
      return;
    } finally {
      setLoader(false);
    }

    Get.offAllNamed(Routes.LOGIN);
  }

  void onNavigateToLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void setLoader(bool loader) {
    isLoading.value = !isLoading.value;
  }
}
