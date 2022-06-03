import 'package:dio/dio.dart';
import 'package:smartpay_ui/core/models/login_response.dart';
import 'package:smartpay_ui/core/storage/local_storage.dart';

class BaseAPI {

  String baseUrl = "https://smart-pay-mobile.herokuapp.com/api/v1";

  Dio dio = Dio(
    BaseOptions(
      sendTimeout: 30000, // 30 seconds
      receiveTimeout: 30000, // 30 seconds
      contentType: "application/json",
      validateStatus: (int? seconds) => seconds! < 500
    )
  );

  Options defaultOptions = Options(
    sendTimeout: 20000, // 20 seconds
    receiveTimeout: 20000, // 20 seconds
    contentType: "application/json",
    validateStatus: (int? seconds) => seconds! < 500
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