import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("OK"),
        ),
      ],
      titleTextStyle: Get.theme.textTheme.titleLarge!.copyWith(
        color: Get.theme.colorScheme.onBackground,
      ),
      contentTextStyle: Get.theme.textTheme.bodyMedium!.copyWith(
        color: Get.theme.colorScheme.onBackground,
      ),
    );
  }
}
