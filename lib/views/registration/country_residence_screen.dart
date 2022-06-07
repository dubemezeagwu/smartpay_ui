import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/viewmodels/auth_vm.dart';
import 'package:smartpay_ui/views/base_view.dart';
import 'package:smartpay_ui/views/registration/create_pin_screen.dart';
import 'package:smartpay_ui/views/widgets/country_list_picker.dart';

import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../../core/routes/routes.dart';
import '../login/login_otp_auth_screen.dart';
import '../widgets/appbar_back_button.dart';
import '../widgets/custom_black_button.dart';
import '../widgets/custom_textfield.dart';

class CountryResidenceScreen extends StatefulWidget {
  const CountryResidenceScreen({
    Key? key,
    this.userEmail = "",
    this.userPassword = "",
    this.fullName = ""}) : super(key: key);
  final String userEmail ;
  final String userPassword;
  final String fullName;

  @override
  State<CountryResidenceScreen> createState() => _CountryResidenceScreenState();
}

class _CountryResidenceScreenState extends State<CountryResidenceScreen> {

  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseView(
        builder: (_,AuthViewModel model, __) => GestureDetector(
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
                          countryListPicker(context, model),
                          // _emailWidget(),
                          SizedBox(height: 143.h,),
                        ],
                      ),
                      const Spacer(),
                  customBlackButton("Continue", true, onTap: (){
                    routeTo(context, CreatePINScreen(userRegistrationData: {
                      'full_name': widget.fullName,
                      'email': widget.userEmail,
                      'country': model.code,
                      'password': widget.userPassword,
                      'device_name': 'web'
                    },));
                  }),
                      SizedBox(height: 10.h,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }






}