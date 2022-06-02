import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/config/size_config.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/views/registration/signup_screen.dart';

import '../../app/app_assets.dart';
import '../../app/colors.dart';
import '../../app/styles.dart';
import '../widgets/custom_black_button.dart';

class SecondOnboardingScreen extends StatefulWidget {
  const SecondOnboardingScreen({Key? key}) : super(key: key);

  @override
  State<SecondOnboardingScreen> createState() => _SecondOnboardingScreenState();
}

class _SecondOnboardingScreenState extends State<SecondOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Text("Skip", style: boldPrimary16,),
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 83.h,),
              Stack(
                children: [
                  Center(child: Image.asset(AppAssets.onboardingTwoDevicePic)),
                  Padding(
                    padding: EdgeInsets.only(top: 80.h),
                    child: Center(child: SvgPicture.asset(AppAssets.onboardingTwoIllustrations)),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 248.h),
                    child: Container(
                      height: 203.h,
                      width: double.infinity,
                      color: AppColors.background,
                      child: Column(
                        children: [
                          SizedBox(height: 46.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.h),
                            child: Text("The fastest transaction process only here",
                              style: boldBlack24,
                              textAlign: TextAlign.center,),
                          ),
                          SizedBox(height: 16.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: Text("Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.",
                              style: regularGrey16,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: customBlackButton(
                "Get Started",
                true,
                onTap: (){
                  routeTo(context, SignUpScreen());
                }),
          ),
        ],)
      ,
    );
  }
}
