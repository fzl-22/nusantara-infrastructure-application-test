import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/constants/api_endpoints.dart';
import 'package:nusantara_infrastructure_application_test/app/data/models/user_model.dart';
import 'package:nusantara_infrastructure_application_test/app/data/services/local_service.dart';
import 'package:nusantara_infrastructure_application_test/app/data/services/network_service.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/error_dialog.dart';
import 'package:nusantara_infrastructure_application_test/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  late final Rx<UserModel> user;
  final token = "".obs;

  @override
  void onInit() {
    onGetToken();
    onFetchUserData();
    super.onInit();
  }

  void onGetToken() {
    token.value = LocalService.read(key: "token") ?? "";
  }

  void onFetchUserData() async {
    setLoader(true);
    try {
      final response = await NetworkService.get(
        endpoint: ApiEndpoints.GETUSER_ENDPOINT,
        token: token.value,
      );

      if (response["message"] == "Unauthenticated.") {
        Get.dialog(
          const ErrorDialog(
            title: "Unauthenticated",
            message: "Can't log out, you are unauthenticated",
          ),
        );
        return;
      }

      user = UserModel.fromJson(response).obs;
      setLoader(false);
      update();
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

  void onSubmitLogout() async {
    setLoader(true);

    try {
      final response = await NetworkService.delete(
        endpoint: ApiEndpoints.LOGOUT_ENDPOINT,
        token: token.value,
      );

      if (response["message"] == "Unauthenticated.") {
        Get.dialog(
          const ErrorDialog(
            title: "Unauthenticated",
            message: "Can't log out, you are unauthenticated",
          ),
        );
        return;
      }

      LocalService.erase();

      Get.offAllNamed(Routes.LOGIN);
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

  void onNavigateToProfile() {
    Get.toNamed(Routes.PROFILE);
  }

  void setLoader(bool loader) {
    isLoading.value = loader;
    update();
  }
}
