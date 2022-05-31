import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/config/size_config.dart';
import 'package:smartpay_ui/app/styles.dart';
import 'package:smartpay_ui/views/widgets/appbar_back_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton(),
      ),
      body: Container(
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
          ],
        ),
      ),
    );
  }
}
