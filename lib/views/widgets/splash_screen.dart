import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay_ui/app/app_assets.dart';
import 'package:smartpay_ui/app/config/extensions.dart';

import '../../app/config/size_config.dart';
import '../../app/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 72.h,
                width: 72.w,
                child: SvgPicture.asset(AppAssets.appLogo)
            ),
            SizedBox(height: 16.h,),
            RichText(
              text: TextSpan(
                text: 'Smart',
                style: boldBlack32,
                children: [
                  TextSpan(
                      text: "pay.",
                      style: boldPrimary32
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
