import 'package:dio/dio.dart';
import 'package:smartpay_ui/core/models/login_response.dart';
import 'package:smartpay_ui/core/storage/local_storage.dart';

String baseUrl = "https://smart-pay-mobile.herokuapp.com/api/v1/";

class BaseAPI {

  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'Accept': 'application/json'},
      sendTimeout: 30000, // 30 seconds
      receiveTimeout: 30000, // 30 seconds
      contentType: "application/json",
      validateStatus: (int? seconds) => seconds! < 500
    )
  );

  Options defaultOptions = Options(
    headers: {'Accept': 'application/json', "Authorization": "Bearer ${AppCache.myToken}"},
    contentType: "application/json",
  );

  String? getToken () {
    String? token = AppCache.myToken;
    return token;
  }

  LoginData? getUser() {
    LoginData? user = AppCache.getUser;
    return user;
  }
}