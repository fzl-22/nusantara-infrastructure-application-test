import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/input_field.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/separator.dart';
import 'package:nusantara_infrastructure_application_test/app/modules/shared/widgets/submit_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(48),
              child: Image.asset(
                "assets/images/login/login-illustration.png",
                fit: BoxFit.contain,
                height: 0.2 * MediaQuery.of(context).size.height,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 32,
                  right: 24,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: GetX<LoginController>(
                  builder: (controller) {
                    return SingleChildScrollView(
                      child: Form(
                        key: controller.formKey.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Proceed with your",
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
                              "LOGIN",
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
                            SubmitButton(
                              onSubmit: controller.onSubmitLogin,
                              text: "LOGIN",
                            ),
                            const Separator(
                              height: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "New to HiBook? ",
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
                                    text: "REGISTER",
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
                                      ..onTap = controller.onNavigateToRegister,
                                  ),
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
