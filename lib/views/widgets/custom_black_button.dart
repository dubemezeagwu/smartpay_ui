import 'package:flutter/cupertino.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/config/size_config.dart';

import '../../app/colors.dart';
import '../../app/styles.dart';

Widget customBlackButton (String text, {void Function()? onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: SizeConfig.screenWidth,
      height: 56.h,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.all(Radius.circular(16)),

      ),
      child: Text(
        text,
        style: boldWhite16,
      ),
    ),
  );
}