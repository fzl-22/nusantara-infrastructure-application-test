import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/constants/api_endpoints.dart';
import 'package:nusantara_infrastructure_application_test/app/data/services/local_service.dart';
import 'package:nusantara_infrastructure_application_test/app/data/services/network_service.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/error_dialog.dart';
import 'package:nusantara_infrastructure_application_test/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isLoading = false.obs;

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

  void onSubmitLogin() async {
    formKey.value.currentState!.save();

    if (!formKey.value.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> body = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };

    setLoader(true);
    try {
      final response = await NetworkService.post(
        endpoint: ApiEndpoints.LOGIN_ENDPOINT,
        body: body,
      );

      if (response['message'] == "Invalid credentials") {
        Get.dialog(
          const ErrorDialog(
            title: "Invalid credentials",
            message: "Incorrect email or password",
          ),
        );

        return;
      }

      LocalService.write(key: "token", value: response["token"]);

      Get.offAllNamed(Routes.HOME);
    } catch (error) {
      Get.dialog(
        const ErrorDialog(
          title: "Unknown error",
          message: "An unknown error occured. Please try again later",
        ),
      );
      return;
    } finally {
      setLoader(false);
    }
  }

  void onNavigateToRegister() {
    Get.offAllNamed(Routes.REGISTER);
  }

  void setLoader(bool loader) {
    isLoading.value = !isLoading.value;
  }
}
