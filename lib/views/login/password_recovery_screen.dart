import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/views/login/login_otp_auth_screen.dart';

import '../../app/app_assets.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';
import '../widgets/custom_textfield.dart';
class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {

  late TextEditingController _userEmail;
  late TextEditingController _userPassword;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _userEmail = TextEditingController(text: "");
    _userPassword = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _userEmail.dispose();
    _userPassword.dispose();
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
          }),
        ),
        body: SizedBox(
          child: SafeArea(
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
                      Text("Password Recovery",style: boldBlack24,),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("Enter your registered email below to receive password instructions",style: regularGrey16,),
                      SizedBox(
                        height: 32.h,
                      ),
                      _emailWidget(),
                      SizedBox(height: 143.h,),
                      // SizedBox(height: 32.h,),
                    ],
                  ),
                  Spacer(),
                  _sendVerificationButton(),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  // EMAIL SECTION FOR PASSWORD RECOVERY SCREEN.
  Widget _emailWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
      ],
    );
  }

  // INSERT EMAIL WIDGET
  Widget _emailField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      enabled: true,
      title: 'Email',
      textFormKey: Key("userEmail"),
      controller: _userEmail,
      obscureText: false,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Email" : null,

    );
  }

  // SEND VERIFICATION BUTTON
  Widget _sendVerificationButton() {
    return customBlackButton("Send Verification Code", true, onTap: (){
      routeTo(context, LoginOTPAuthenticationScreen());
    });
  }

}
