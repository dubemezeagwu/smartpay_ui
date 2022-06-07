import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/storage/local_storage.dart';
import 'package:smartpay_ui/core/viewmodels/auth_vm.dart';
import 'package:smartpay_ui/views/login/login_screen.dart';
import 'package:smartpay_ui/views/registration/country_residence_screen.dart';

import '../../app/app_assets.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../../core/viewmodels/base_vm.dart';
import '../base_view.dart';
import '../login/password_recovery_screen.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/other_signin_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _obscureText = false;
  late TextEditingController _fullName;
  late TextEditingController _userEmail;
  late TextEditingController _userPassword;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _fullName = TextEditingController(text: "");
    _userEmail = TextEditingController(text: "");
    _userPassword = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _fullName.dispose();
    _userEmail.dispose();
    _userPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseView(
      builder: (_, AuthViewModel model, __) {
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
                        RichText(
                          text: TextSpan(
                            text: 'Create a ',
                            style: boldBlack24,
                            children: [
                              TextSpan(
                                  text: "Smartpay",
                                  style: boldPrimary24
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text("account",style: boldBlack24,),
                        SizedBox(
                          height: 32.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _registrationWidget(),
                            SizedBox(height: 24.h,),
                            _signupButton(model),
                            SizedBox(height: 32.h,),
                            Center(child: Text("OR", style: regularGrey16,)),
                            SizedBox(height: 35.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: (){},
                                    child: otherSignInButton(AppAssets.googleLogo)
                                ),
                                GestureDetector(
                                    onTap: (){},
                                    child: otherSignInButton(AppAssets.appleLogo)
                                ),
                              ],
                            ),
                            SizedBox(height: 120.h,),
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
      },
    );
  }

  // TOGGLES PASSWORD VISIBILITY
  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // EMAIL & PASSWORD SECTION FOR LOGIN SCREEN.
  Widget _registrationWidget() {
    return Column(
      children: <Widget>[
        _fullNameField(),
        SizedBox(
          height: 16.h,
        ),
        _emailField(),
        SizedBox(
          height: 16.h,
        ),
        _passwordField(),
      ],
    );
  }

  // NAME WIDGET
  Widget _fullNameField() {
    return CustomTextField(
      keyboardType: TextInputType.name,
      enabled: true,
      title: 'Full Name',
      textFormKey: Key("fullName"),
      controller: _fullName,
      obscureText: false,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Your Name" : null,

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

  // SIGN-UP BUTTON
  Widget _signupButton(AuthViewModel model) {
    return customBlackButton("Sign Up", true, onTap: () async {
      var getEmailRequest = {
        "email" : _userEmail.text
      };
      var verifyEmailRequest = {
        "email" : _userEmail.text,
        "token" : AppCache.myToken
      };
      await model.getEmailToken(getEmailRequest);
      print("Get Email Response: ${model.authGetEmailResponse}");
      await model.verifyEmailToken(verifyEmailRequest);
      routeTo(context, CountryResidenceScreen(
        fullName: _fullName.text,
        userPassword: _userEmail.text,
        userEmail: _userPassword.text,
      ));
    });
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
        routeTo(context, LoginScreen());
      },
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: regularGrey16,
          children: [
            TextSpan(
                text: "Sign In",
                style: boldPrimary16
            ),
          ],
        ),
      ),
    );
  }
}