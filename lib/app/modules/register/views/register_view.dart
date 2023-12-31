import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/input_field.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/separator.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/submit_button.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(48),
              child: Image.asset(
                "assets/images/register/register-illustration.png",
                fit: BoxFit.contain,
                height: 0.3 * MediaQuery.of(context).size.height,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 24,
                  top: 32,
                  right: 24,
                  bottom:
                      MediaQuery.of(context).viewInsets.bottom != 0 ? 0 : 24,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: GetX<RegisterController>(
                  builder: (controller) {
                    return SingleChildScrollView(
                      child: Form(
                        key: controller.formKey.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Let's get started",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                            const Separator(
                              height: 4,
                            ),
                            Text(
                              "REGISTER",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const Separator(
                              height: 32,
                            ),
                            InputField(
                              controller: controller.emailController.value,
                              hintText: "Email",
                              keyboardType: TextInputType.emailAddress,
                              validator: controller.emailValidator,
                            ),
                            const Separator(
                              height: 12,
                            ),
                            InputField.password(
                              controller: controller.passwordController.value,
                              hintText: "Password",
                              keyboardType: TextInputType.visiblePassword,
                              validator: controller.passwordValidator,
                            ),
                            const Separator(
                              height: 12,
                            ),
                            InputField.password(
                              controller:
                                  controller.confirmPasswordController.value,
                              hintText: "Confirm Password",
                              keyboardType: TextInputType.visiblePassword,
                              validator: controller.confirmPasswordValidator,
                            ),
                            const Separator(
                              height: 12,
                            ),
                            SubmitButton(
                              onSubmit: controller.onSubmitRegister,
                              text: "REGISTER",
                            ),
                            const Separator(
                              height: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "LOGIN",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = controller.onNavigateToLogin,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
