import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:smartpay_ui/core/models/login_response.dart';
import 'package:smartpay_ui/core/storage/local_storage.dart';

class BaseAPI {

  String baseUrl = GlobalConfiguration().getString("base_url");

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