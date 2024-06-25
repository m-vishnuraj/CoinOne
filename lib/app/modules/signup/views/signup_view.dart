import 'package:coin_one/constants.dart';
import 'package:coin_one/app/modules/widgets/edit_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                'Signup',
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
              ),
              kHeight,
              EditText(
                text: 'Enter Password',
                textInputType: TextInputType.visiblePassword,
                textEditingController: controller.passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor.withOpacity(.8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              kHeight,
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
