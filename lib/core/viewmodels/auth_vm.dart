import 'package:country_list_pick/support/code_country.dart';
import 'package:smartpay_ui/core/api/auth_api.dart';
import 'package:smartpay_ui/core/models/login_response.dart';
import 'package:smartpay_ui/core/models/register_response.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/core/utils/custom_exception.dart';
import 'package:smartpay_ui/core/viewmodels/base_vm.dart';

import '../../locator.dart';
import '../storage/local_storage.dart';

class AuthViewModel extends BaseViewModel{
  final AuthAPI _authAPI = locator<AuthAPI>();
  late LoginData userLoginData;
  late RegisterResponse userRegisterData;
  late String code;
  late String otp;

  void setCountryCode (String value){
    code = value;
    notifyListeners();
  }
  Future <RegisterResponse?> register (Map<String, dynamic> data ) async {
    setBusy(true);
    try {
      final response = await _authAPI.register(data);
      print(response);
      userRegisterData = response;
      print(userRegisterData);
      AppCache.setMyToken(userRegisterData.data.token);
      setBusy(false);
      return response;
    } on CustomException catch (e){
      print(e);
      setBusy(false);
    }
    notifyListeners();
  }
}