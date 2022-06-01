import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/views/widgets/country_list_picker.dart';

import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../login/otp_auth_screen.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';
import '../widgets/custom_textfield.dart';

class CountryResidenceScreen extends StatefulWidget {
  const CountryResidenceScreen({Key? key}) : super(key: key);

  @override
  State<CountryResidenceScreen> createState() => _CountryResidenceScreenState();
}

class _CountryResidenceScreenState extends State<CountryResidenceScreen> {

  late TextEditingController _userEmail;
  late TextEditingController _userPassword;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _userEmail = TextEditingController(text: "");
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
                      Text("Country of Residence",style: boldBlack24,),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("Please select all the countries that you’re a tax resident in",style: regularGrey16,),
                      SizedBox(
                        height: 32.h,
                      ),
                      countryListPicker(),
                      // _emailWidget(),
                      SizedBox(height: 143.h,),
                      // SizedBox(height: 32.h,),
                    ],
                  ),
                  Spacer(),
                  _continueButton(),
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
      enabled: true,
      title: 'Email',
      textFormKey: Key("userEmail"),
      controller: _userEmail,
      obscureText: false,
      enableInteractive: false,
      validator: (value) => (value!.isEmpty) ? "Please Enter Email" : null,

    );
  }

  // CONTINUE BUTTON
  Widget _continueButton() {
    return customBlackButton("Continue", onTap: (){
      // routeTo(context, OTPAuthenticationScreen());
    });
  }

}