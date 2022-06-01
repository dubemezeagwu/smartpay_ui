import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/views/login/new_password_screen.dart';
import 'package:smartpay_ui/views/login/password_recovery_screen.dart';

import '../../app/app_assets.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/other_signin_button.dart';
class OTPAuthenticationScreen extends StatefulWidget {
  const OTPAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<OTPAuthenticationScreen> createState() => _OTPAuthenticationScreenState();
}

class _OTPAuthenticationScreenState extends State<OTPAuthenticationScreen> {

  bool _obscureText = false;
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
                    SizedBox(height: 56.h,),
                    Center(child: _resendCode()),
                    SizedBox(height: 32.h,),

                  ],
                ),
                const Spacer(),
                _confirmButton(),
                SizedBox(height: 10.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TOGGLES PASSWORD VISIBILITY
  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // CONFIRM BUTTON
  Widget _confirmButton() {
    return customBlackButton("Confirm", onTap: (){
      routeTo(context, NewPasswordScreen());
    });
  }

  // FORGOT PASSWORD
  Widget _resendCode() {
    return GestureDetector(
      onTap: () {
        // if (_userEmail.text != "") resetPassword(_userEmail.text);
      },
      child: Text('Resend Code',
          style: boldPrimary16),
    );
  }

}
