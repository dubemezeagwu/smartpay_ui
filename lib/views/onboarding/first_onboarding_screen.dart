import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay_ui/app/app_assets.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/styles.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/views/onboarding/second_onboarding_screen.dart';
import 'package:smartpay_ui/views/widgets/custom_black_button.dart';

import '../../app/config/size_config.dart';

class FirstOnboardingScreen extends StatefulWidget {
  const FirstOnboardingScreen({Key? key}) : super(key: key);

  @override
  State<FirstOnboardingScreen> createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: GestureDetector(
              onTap: (){
                routeTo(context, SecondOnboardingScreen());
              },
                child: Text("Skip", style: boldPrimary16,)
            ),
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
                  Center(child: Image.asset(AppAssets.onboardingOneDevicePic)),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Center(child: SvgPicture.asset(AppAssets.onboardingOneIllustrations)),
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
                            child: Text("Finance app the safest and most trusted",
                              style: boldBlack24,
                              textAlign: TextAlign.center,),
                          ),
                          SizedBox(height: 16.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            child: Text("Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
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
            child: customBlackButton("Get Started", true),
          ),
        ],)
      ,
    );
  }
}
