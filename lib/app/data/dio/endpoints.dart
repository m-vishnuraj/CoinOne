import 'package:coin_one/app/data/dio/dio_client.dart';

enum EndPoints {
  home,
}

extension EndPointsExtension on EndPoints {
  String path() {
    String path = "";

    switch (this) {
      case EndPoints.home:
        path = "FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2";
        break;
    }

    return path;
  }

  HttpMethod method() {
    HttpMethod method;

    switch (this) {
      case EndPoints.home:
        method = HttpMethod.get;
        break;
    }

    return method;
  }

  bool hasToken() {
    bool hasToken = false;

    switch (this) {
      case EndPoints.home:
        hasToken = true;
        break;
    }

    return hasToken;
  }
}
