import 'package:coin_one/app/data/dio/dio_client.dart';
import 'package:coin_one/app/data/dio/endpoints.dart';
import 'package:coin_one/app/data/models/info_res.dart';
import 'package:dio/dio.dart';

class InfoRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<List<InfoRes>> getInfo(String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.info,
        queryParameters: id,
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => InfoRes.fromJson(json)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
