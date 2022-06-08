import 'package:smartpay_ui/core/api/home_api.dart';
import 'package:smartpay_ui/core/models/home_response.dart';
import 'package:smartpay_ui/core/viewmodels/base_vm.dart';
import 'package:smartpay_ui/locator.dart';

import '../utils/custom_exception.dart';

class HomeViewModel extends BaseViewModel {
  final HomeAPI _homeAPI = locator<HomeAPI>();
  late dynamic message;

  Future<dynamic> getMessage () async {
    setBusy(true);
    try {
      final HomeResponse response = await _homeAPI.getMessage();
      print(response);
      message = response.data.secret;
      setBusy(false);
      return response;
    } on CustomException catch(e){
      print(e);
      setBusy(false);
    }
  }
}