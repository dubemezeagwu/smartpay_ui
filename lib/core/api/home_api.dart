import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:smartpay_ui/core/api/base_api.dart';
import 'package:smartpay_ui/core/models/home_response.dart';

import '../utils/custom_exception.dart';
import '../utils/error_util.dart';

class HomeAPI extends BaseAPI {
  Logger log = Logger();

  Future<dynamic> getMessage() async {
    const String url = 'dashboard';
    try {
      final Response<dynamic> res = await dio.get<dynamic>(url, options: defaultOptions);
      log.d(res.data);
      switch (res.statusCode) {
        case 200:
          try {
            return HomeResponse.fromJson(res.data);
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
}