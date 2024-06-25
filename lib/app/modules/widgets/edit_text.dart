import 'package:coin_one/constants.dart';
import 'package:coin_one/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditText extends StatelessWidget {
  final double top, left, right, bottom;
  final String text;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final bool isPassword;
  final RxBool? passwordVisible;

  const EditText({
    Key? key,
    this.top = 30.0,
    this.left = 22.0,
    this.right = 22.0,
    this.bottom = 0.0,
    required this.text,
    required this.textEditingController,
    this.textInputType,
    this.isPassword = true,
    this.passwordVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Padding(
      padding: EdgeInsets.only(top: top, left: left, right: right),
      child: Obx(() => TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            obscureText: controller.passwordVisible.value && isPassword == true
                ? true
                : false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              focusColor: kPrimaryColor,
              labelText: text,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              labelStyle: const TextStyle(color: kPrimaryColor),
              suffixIcon: isPassword && passwordVisible != null
                  ? IconButton(
                      icon: Icon(
                        passwordVisible!.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        passwordVisible!.value = !passwordVisible!.value;
                      },
                    )
                  : null,
            ),
          )),
    );
  }
}
