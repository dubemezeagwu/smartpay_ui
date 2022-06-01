import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/views/login/reset_password_success_screen.dart';

import '../../app/app_assets.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';
import '../widgets/custom_textfield.dart';
import 'otp_auth_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  bool _obscureText = false;
  late TextEditingController _userNewPassword;
  late TextEditingController _userConfirmNewPassword;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _userNewPassword = TextEditingController(text: "");
    _userConfirmNewPassword = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _userNewPassword.dispose();
    _userConfirmNewPassword.dispose();
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
                      Text("Create New Password",style: boldBlack24,),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("Please, enter a new password below different from the previous password",style: regularGrey16,),
                      SizedBox(
                        height: 32.h,
                      ),
                      _passwordWidget(),
                      // SizedBox(height: 32.h,),
                    ],
                  ),
                  Spacer(),
                  _createNewPasswordButton(),
                ],
              ),
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


  // EMAIL SECTION FOR PASSWORD RECOVERY SCREEN.
  Widget _passwordWidget() {
    return Column(
      children: <Widget>[
        _passwordField(),
        SizedBox(height: 16.h,),
        _confirmPasswordField(),
      ],
    );
  }

  // INSERT PASSWORD WIDGET
  Widget _passwordField() {
    return CustomTextField(
      enabled: true,
      title: 'Password',
      textFormKey: Key("userPassword"),
      controller: _userNewPassword,
      obscureText: _obscureText,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Password" : null,
      suffixIcon: GestureDetector(
        onTap: _togglePassword,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
              onPressed: (){
                _togglePassword();
              },
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(child: SvgPicture.asset(AppAssets.eyeSlash,height: 24,)),
              )
          ),
        ),
      ),

    );
  }

  // INSERT PASSWORD WIDGET
  Widget _confirmPasswordField() {
    return CustomTextField(
      enabled: true,
      title: 'Confirm Password',
      textFormKey: Key("userPassword"),
      controller: _userConfirmNewPassword,
      obscureText: _obscureText,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Password" : null,
      suffixIcon: GestureDetector(
        onTap: _togglePassword,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
              onPressed: (){
                _togglePassword();
              },
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(child: SvgPicture.asset(AppAssets.eyeSlash,height: 24,)),
              )
          ),
        ),
      ),

    );
  }

  // SEND VERIFICATION BUTTON
  Widget _createNewPasswordButton() {
    return customBlackButton("Create New Password", onTap: (){
      routeTo(context, ResetPasswordSuccessScreen());
    });
  }

}
