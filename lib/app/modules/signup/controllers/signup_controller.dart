import 'package:coin_one/app/modules/home/views/home_view.dart';
import 'package:coin_one/app/modules/login/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final keepMeLoggedIn = false.obs;

  late Rx<User?> firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? keepLoggedIn = prefs.getBool('keepLoggedIn');
    if (keepLoggedIn != null) {
      keepMeLoggedIn.value = keepLoggedIn;
    }
    if (keepMeLoggedIn.value) {
      firebaseUser = Rx<User?>(auth.currentUser);
      firebaseUser.bindStream(auth.userChanges());
      ever(firebaseUser, _setInitialScreen);
    }
  }

  @override
  void onReady() {
    super.onReady();
    // Listen to changes in keepMeLoggedIn and save to SharedPreferences
    ever(keepMeLoggedIn, (bool value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('keepLoggedIn', value);
    });
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginView());
    } else {
      Get.offAll(() => HomeView());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAll(() => HomeView());
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case "email-already-in-use":
          errorMessage =
              "The email address is already in use by another account.";
          break;
        case "invalid-email":
          errorMessage = "The email address is not valid.";
          break;
        case "weak-password":
          errorMessage = "The password is too weak.";
          break;
        default:
          errorMessage = "An undefined error happened.";
      }

      Get.snackbar(
        "Error",
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "An unexpected error occurred. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void signup() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else {
      register(email, password);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
