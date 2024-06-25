import 'package:coin_one/app/data/dio/repo/home_repo.dart';
import 'package:coin_one/app/data/models/home_res_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  void logout() {
    Get.offAllNamed('/login');
  }
}
