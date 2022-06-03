import 'package:smartpay_ui/core/api/auth_api.dart';
import 'package:smartpay_ui/core/models/login_response.dart';
import 'package:smartpay_ui/core/models/register_response.dart';
import 'package:smartpay_ui/core/viewmodels/base_vm.dart';

import '../../locator.dart';

class AuthViewModel extends BaseViewModel{
  final AuthAPI _authAPI = locator<AuthAPI>();
  late LoginData userLoginData;
  late RegisterData userRegisterData;
  late final Map<String,dynamic> tempRegisterData = {
    "fullName": "",
    "email": "",
    "username": "",
    "country": "",
    "password": "",
    "deviceName": "web",
  };
  late String  otp;

  Future <void> register (Map<String, String> data ) async {
    setBusy(true);
    try{
      userRegisterData = await _authAPI.register(data);
    } catch (e){

    }
  }
}