import 'package:country_list_pick/support/code_country.dart';
import 'package:smartpay_ui/core/api/auth_api.dart';
import 'package:smartpay_ui/core/models/auth_response.dart';
import 'package:smartpay_ui/core/models/login_response.dart';
import 'package:smartpay_ui/core/models/register_response.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/core/utils/custom_exception.dart';
import 'package:smartpay_ui/core/viewmodels/base_vm.dart';

import '../../locator.dart';
import '../storage/local_storage.dart';

class AuthViewModel extends BaseViewModel{
  final AuthAPI _authAPI = locator<AuthAPI>();
  late LoginResponse userLoginData;
  late RegisterResponse userRegisterData;
  late AuthResponse authGetEmailResponse;
  late AuthResponse authVerifyEmailResponse;
  late String code;
  late String authToken = "";

  void setCountryCode (String value){
    code = value;
    notifyListeners();
  }

  Future <LoginResponse?> login (Map<String, dynamic> data ) async {
    setBusy(true);
    try {
      final response = await _authAPI.login(data);
      print(response);
      userLoginData = response;
      print("User Login Data ${userLoginData}");
      // AppCache.setMyToken(userRegisterData.data.token);
      setBusy(false);
      return response;
    } on CustomException catch (e){
      print(e);
      setBusy(false);
    }
    notifyListeners();
  }


  Future <RegisterResponse?> register (Map<String, dynamic> data ) async {
    setBusy(true);
    try {
      final response = await _authAPI.register(data);
      print(response);
      userRegisterData = response;
      print("User Register Data ${userRegisterData}");
      // AppCache.setMyToken(userRegisterData.data.token);
      setBusy(false);
      return response;
    } on CustomException catch (e){
      print(e);
      setBusy(false);
    }
    notifyListeners();
  }

  Future <AuthResponse?> getEmailToken (Map<String, dynamic> data ) async {
    setBusy(true);
    try {
      final response = await _authAPI.getEmailToken(data);
      print("VM response: ${response}");
      authGetEmailResponse = response;
      print("Auth Token: ${authGetEmailResponse.data.token}");
      AppCache.setMyToken(authGetEmailResponse.data.token!);
      // authToken = authGetEmailResponse.data.token!;
      print(authToken);
      setBusy(false);
      return response;
    } on CustomException catch (e){
      print(e);
      setBusy(false);
    }
    notifyListeners();
  }

  Future <AuthResponse?> verifyEmailToken (Map<String, dynamic> data ) async {
    setBusy(true);
    try {
      final response = await _authAPI.verifyEmailToken(data);
      print(response);
      authVerifyEmailResponse = response;
      print(authVerifyEmailResponse.data.email);
      setBusy(false);
      return response;
    } on CustomException catch (e){
      print(e);
      setBusy(false);
    }
    notifyListeners();
  }
}