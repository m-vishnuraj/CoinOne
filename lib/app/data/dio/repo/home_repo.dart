import 'package:coin_one/app/data/dio/dio_client.dart';
import 'package:coin_one/app/data/dio/endpoints.dart';
import 'package:coin_one/app/data/models/home_res_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<List<HomeRes>> getHome() async {
    try {
      final response = await dioClient.mainReqRes(endPoints: EndPoints.home);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => HomeRes.fromJson(json)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
