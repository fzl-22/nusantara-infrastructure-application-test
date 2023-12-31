import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/activity_loading.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/separator.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/submit_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    void onTapLogout() {
      Get.dialog(
        AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          titleTextStyle: Get.theme.textTheme.titleLarge!.copyWith(
            color: Get.theme.colorScheme.onBackground,
          ),
          contentTextStyle: Get.theme.textTheme.bodyMedium!.copyWith(
            color: Get.theme.colorScheme.onBackground,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
            SubmitButton(
              onSubmit: () {
                Get.back();
                controller.onSubmitLogout();
              },
              text: "Logout",
              isLoading: controller.isLoading.value,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: GetX<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return controller.isLoading.value
                  ? ActivityLoading(color: Get.theme.colorScheme.primary)
                  : Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${controller.user.value.name.capitalize}'s Books",
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  IconlyBold.plus,
                                  size: 36,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.user.value.email,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                      color: Get.theme.colorScheme.onBackground,
                                    ),
                                  ),
                                  const Separator(
                                    width: 12,
                                  ),
                                  GestureDetector(
                                    onTap: onTapLogout,
                                    child: Icon(
                                      IconlyLight.logout,
                                      color: Get.theme.colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Get.theme.colorScheme.onBackground
                              .withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Center(
                            child: Text(
                              'Token: ${controller.token}',
                              style: Get.theme.textTheme.bodyMedium!.copyWith(
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
