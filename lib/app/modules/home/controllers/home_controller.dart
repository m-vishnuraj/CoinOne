import 'package:coin_one/app/data/dio/repo/home_repo.dart';
import 'package:coin_one/app/data/models/home_res_model.dart';
import 'package:coin_one/app/modules/login/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  // Initialize Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<HomeRes>> getHome() async {
    final HomeRepo _homeRepo = HomeRepo();
    try {
      return await _homeRepo.getHome();
    } catch (e) {
      // Handle error, maybe show a snackbar
      Get.snackbar('Error', 'Failed to fetch home data: $e');
      return []; // Return an empty list in case of error
    }
  }

  void logout() async {
    try {
      await auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('keepLoggedIn', false);
      Get.offAll(() => LoginView());
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
