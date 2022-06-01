import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartpay_ui/app/app_assets.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/config/size_config.dart';
import 'package:smartpay_ui/app/styles.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/views/login/new_password_screen.dart';
import 'package:smartpay_ui/views/login/password_recovery_screen.dart';
import 'package:smartpay_ui/views/widgets/appbar_back_button.dart';
import 'package:smartpay_ui/views/widgets/custom_black_button.dart';
import 'package:smartpay_ui/views/widgets/other_signin_button.dart';

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
          leading: appBarBackButton(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formPageKey,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Text("Hi There!",style: boldBlack24,),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text("Welcome back, Sign in to your account",style: regularGrey16,),
                    SizedBox(
                      height: 32.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _emailPasswordWidget(),
                        SizedBox(height: 24.h,),
                        _forgotPassword(),
                        SizedBox(height: 24.h,),
                        _loginButton(),
                        SizedBox(height: 32.h,),
                        Center(child: Text("OR", style: regularGrey16,)),
                        SizedBox(height: 35.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            otherSignInButton(AppAssets.googleLogo),
                            otherSignInButton(AppAssets.appleLogo),
                          ],
                        ),
                        // SizedBox(height: 160.h,),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                        child: _createAccountLabel())
                  ],
                ),
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

  // EMAIL & PASSWORD SECTION FOR LOGIN SCREEN.
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        SizedBox(
          height: 16,
        ),
        _passwordField(),
      ],
    );
  }

  // INSERT EMAIL WIDGET
  Widget _emailField() {
    return CustomTextField(
      enabled: true,
      title: 'Email',
      textFormKey: Key("userEmail"),
      controller: _userEmail,
      obscureText: false,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Email" : null,

    );
  }

  // INSERT PASSWORD WIDGET
  Widget _passwordField() {
    return CustomTextField(
      enabled: true,
      title: 'Password',
      textFormKey: Key("userPassword"),
      controller: _userPassword,
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

  // SIGN-IN BUTTON
  Widget _loginButton() {
    return customBlackButton("Sign In", onTap: (){});
  }

  // FORGOT PASSWORD
  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () {
        routeTo(context, PasswordRecoveryScreen());
      },
      child: Text('Forgot Password?',
          style: boldPrimary16),
    );
  }

  Widget _createAccountLabel (){
    return GestureDetector(
      onTap: (){
        routeTo(context, PasswordRecoveryScreen());
      },
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: regularGrey16,
          children: [
            TextSpan(
                text: "Sign Up",
                style: boldPrimary16
            ),
          ],
        ),
      ),
    );
  }
}
