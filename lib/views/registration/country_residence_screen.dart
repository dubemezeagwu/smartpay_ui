import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/viewmodels/auth_vm.dart';
import 'package:smartpay_ui/views/base_view.dart';
import 'package:smartpay_ui/views/registration/create_pin_screen.dart';
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
                      _continueButton(),
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


  // CONTINUE BUTTON
  Widget _continueButton() {
    return customBlackButton("Continue", true, onTap: (){
      routeTo(context, CreatePINScreen());
    });
  }

}