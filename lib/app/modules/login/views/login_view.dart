import 'package:coin_one/constants.dart';
import 'package:coin_one/app/modules/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: kSecondaryColor.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              kHeight,
              EditText(
                text: 'Enter Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: controller.emailController,
                isPassword: false,
              ),
              kHeight,
              EditText(
                text: 'Enter Password',
                textInputType: TextInputType.visiblePassword,
                textEditingController: controller.passwordController,
                isPassword: true,
                passwordVisible: controller.passwordVisible,
              ),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " keep me logged in",
                    style: const TextStyle(fontSize: 15, color: kPrimaryColor),
                  ),
                  Obx(
                    () => Checkbox(
                      activeColor: kPrimaryColor.withOpacity(0.6),
                      checkColor: Colors.white,
                      value: controller.keepMeLoggedIn.value,
                      onChanged: (value) {
                        controller.keepMeLoggedIn.value = value ?? false;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor.withOpacity(.8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              kHeight,
              TextButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: const Text(
                  'Create Account!',
                  style: TextStyle(color: kPrimaryColor, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
