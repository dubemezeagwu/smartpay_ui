import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:smartpay_ui/core/api/base_api.dart';
import 'package:smartpay_ui/core/models/register_response.dart';

import '../models/login_response.dart';
import '../utils/custom_exception.dart';
import '../utils/error_util.dart';

class AuthAPI extends BaseAPI {
  Logger log = Logger();

  Future<LoginData> login(Map<String, String> data) async {
    const String url = 'auth/login';
    try {
      final Response<dynamic> res =
      await dio.post<dynamic>(url, data: data, options: defaultOptions);

      log.d(res.data);
      switch (res.statusCode) {
        case 200:
          try {
            return LoginResponse.fromJson(res.data).data;
          } catch (e) {
            throw "Parsing Error";
          }
          break;
        case 422:
          throw res.data['message'].first.toString().toUpperCase();
          break;
        case 401:
          throw "These credentials are wrong";
          break;
        case 400:
          throw res.data['message'].first;
        case 404:
          throw "This user doesn't exists ";
          break;
        default:
          throw res.data['message'].first ?? 'Unknown Error';
      }
    } catch (e) {
      log.d(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    const String url = 'auth/register';
    try {
      final Response<dynamic> res = await dio.post<dynamic>(url, data: data, options: defaultOptions);
      print(res);

      log.d(res.data);
      switch (res.statusCode) {
        case 200:
          try {
            return RegisterResponse.fromJson(res.data);
          } catch (e) {
            return RegisterResponse.fromJson(res.data);          }
          break;
        case 422:
          return RegisterResponse.fromJson(res.data);
          break;
        case 401:
          throw "These credentials are wrong";
          break;
        case 400:
          throw res.data['message'].first;
        case 404:
          throw "This user doesn't exists ";
          break;
        default:
          throw res.data['message'].first ?? 'Unknown Error';
      }
    } catch (e) {
      log.d(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}