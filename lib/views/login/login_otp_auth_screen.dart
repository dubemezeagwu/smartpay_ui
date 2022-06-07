import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/views/login/new_password_screen.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';

class LoginOTPAuthenticationScreen extends StatefulWidget {
  const LoginOTPAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<LoginOTPAuthenticationScreen> createState() => _LoginOTPAuthenticationScreenState();
}

class _LoginOTPAuthenticationScreenState extends State<LoginOTPAuthenticationScreen> {

  bool _isButtonEnabled = false;
  late TextEditingController _pinCode;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _isButtonEnabled = false;
    _pinCode = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _pinCode.dispose();
    _isButtonEnabled = false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                    Text("Verify it's you",style: boldBlack24,),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text("We send a code to ( *****@mail.com ). Enter it here to verify your identity",style: regularGrey16,),
                    SizedBox(
                      height: 32.h,
                    ),
                    _pinCodeTextField(),
                    Center(child: _resendCode()),
                    SizedBox(height: 32.h,),

                  ],
                ),
                const Spacer(),
                _confirmButton(_isButtonEnabled),
                SizedBox(height: 10.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _pinCodeTextField (){
    return PinCodeTextField(
      controller: _pinCode,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      animationCurve: Curves.easeInOut,
      cursorColor: AppColors.black,
      enableActiveFill: true,
        appContext: context,
        length: 5,
        onCompleted: (_){
          setState(() {
            _isButtonEnabled = true;
          });
        },
      pastedTextStyle: boldBlack24,
      obscureText: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 56.h,
        fieldWidth: 56.w,
        selectedColor: AppColors.primary,
        activeColor: Colors.transparent,
        inactiveColor: Colors.transparent,
        selectedFillColor: AppColors.textFieldInputColor,
        inactiveFillColor: AppColors.textFieldInputColor,
        activeFillColor: AppColors.textFieldInputColor
      ), onChanged: (String value) {},
    );
  }

  // CONFIRM BUTTON
  Widget _confirmButton(bool isButtonEnabled) {
    return customBlackButton("Confirm",
        isButtonEnabled,
        onTap: _isButtonEnabled == false
            ? (){}
            : (){ routeTo(context, NewPasswordScreen());}
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
