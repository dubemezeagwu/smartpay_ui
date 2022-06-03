import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/storage/local_storage.dart';
import 'package:smartpay_ui/core/viewmodels/auth_vm.dart';
import 'package:smartpay_ui/views/base_view.dart';
import 'package:smartpay_ui/views/registration/signup_confirmation_screen.dart';

import '../../app/colors.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';

class CreatePINScreen extends StatefulWidget {
  const CreatePINScreen({Key? key}) : super(key: key);

  @override
  State<CreatePINScreen> createState() => _CreatePINScreenState();
}

class _CreatePINScreenState extends State<CreatePINScreen> {

  bool _isButtonEnabled = false;
  late TextEditingController _pinCode;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();
  late final String appPassCode;

  @override
  void initState() {
    _isButtonEnabled = false;
    _pinCode = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _isButtonEnabled = false;
    _pinCode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseView(
        builder: (_, AuthViewModel model, __){
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              key: _pageKey,
              appBar: AppBar(
                leading: appBarBackButton(
                    onTap: (){
                      Navigator.of(context).pop();
                    }
                ),
              ),
              body: SafeArea(
                child: Form(
                  key: _formPageKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 32.h,
                          ),
                          Text("Set your PIN Code",style: boldBlack24,),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text("We use state-of-the-art security measures to protect your information at all times",style: regularGrey16,),
                          SizedBox(
                            height: 32.h,
                          ),
                          _pinCodeTextField(model),
                          SizedBox(height: 32.h,),

                        ],
                      ),
                      const Spacer(),
                      _createPINButton(_isButtonEnabled, model),
                      SizedBox(height: 10.h,)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }



  // PIN CODE TEXT-FIELD
  Widget _pinCodeTextField (AuthViewModel model){
    return PinCodeTextField(
      controller: _pinCode,
      blinkWhenObscuring: true,
      obscuringCharacter: "●",
      animationType: AnimationType.fade,
      animationCurve: Curves.easeInOut,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primary,
      enableActiveFill: false,
      appContext: context,
      length: 5,
      onChanged: (String value){},
      onCompleted: (value){
        setState(() {
          _isButtonEnabled = true;
          appPassCode = value;
        });
      },
      pastedTextStyle: boldBlack24,
      obscureText: true,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
        selectedColor: AppColors.primary,
        inactiveColor: AppColors.primary,
        activeColor: AppColors.primary
      ),
    );
  }
  // CONFIRM BUTTON
  Widget _createPINButton(bool isButtonEnabled, AuthViewModel model) {
    return customBlackButton(
        "Create PIN",
        isButtonEnabled,
        onTap: _isButtonEnabled == false
            ? (){}
            : (){
          print(appPassCode);
          AppCache.setMyPIN(appPassCode);
          print("This is the App PIN ${AppCache.myPIN}");
          print(model.tempRegisterData);
          // model.register(data);
          // routeTo(context, SignUpConfirmationScreen());
        }
        );
  }

  // FORGOT PASSWORD
  Widget _resendCode() {
    return GestureDetector(
      onTap: () {
      },
      child: Text('Resend Code',
          style: boldPrimary16),
    );
  }

}
