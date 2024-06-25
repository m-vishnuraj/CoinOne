import 'package:coin_one/app/data/dio/repo/info_repo.dart';
import 'package:coin_one/app/data/models/info_res.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
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

  Future<List<InfoRes>> getInfo(String id) async {
    final InfoRepo _infoRepo = InfoRepo();
    try {
      return await _infoRepo.getInfo(id);
    } catch (e) {
      // Handle error, maybe show a snackbar
      Get.snackbar('Error', 'Failed to fetch home data: $e');
      return []; // Return an empty list in case of error
    }
  }
}
