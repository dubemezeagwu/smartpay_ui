import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_ui/app/config/extensions.dart';

import '../../app/app_assets.dart';
import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../widgets/custom_black_button.dart';

class SignUpConfirmationScreen extends StatefulWidget {
  const SignUpConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<SignUpConfirmationScreen> createState() => _SignUpConfirmationScreenState();
}

class _SignUpConfirmationScreenState extends State<SignUpConfirmationScreen> {

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

        body: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: SafeArea(
              child: Form(
                key: _formPageKey,
                child: Column(
                  children: [
                    SvgPicture.asset(AppAssets.transferIllustration),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 57.h,
                        ),
                        Text("Congratulations",style: boldBlack24,),
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34),
                          child: Text(
                            "Hey Anabel, your account has been successfully created 👋",
                            textAlign: TextAlign.center,
                            style: regularGrey16,),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
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
      ),
    );
  }



  // SEND VERIFICATION BUTTON
  Widget _createNewPasswordButton() {
    return customBlackButton("Proceed to Home", true, onTap: (){
    });
  }

}