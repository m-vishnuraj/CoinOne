import 'package:coin_one/app/data/dio/dio_client.dart';

enum EndPoints {
  home,
  info,
}

extension EndPointsExtension on EndPoints {
  String path() {
    String path = "";

    switch (this) {
      case EndPoints.home:
        path = "FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2";
        break;
      case EndPoints.info:
        path =
            "FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=";
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
      case EndPoints.info:
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
      case EndPoints.info:
        hasToken = false;
        break;
    }

    return hasToken;
  }
}
