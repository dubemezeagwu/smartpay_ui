import 'package:flutter/cupertino.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/config/size_config.dart';

import '../../app/colors.dart';
import '../../app/styles.dart';

Widget customBlackButton (String text, bool isActive, {void Function()? onTap, }){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 327.h,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.black : AppColors.black.withOpacity(0.8),
        borderRadius: BorderRadius.all(Radius.circular(16)),

      ),
      child: Text(
        text,
        style: boldWhite16,
      ),
    ),
  );
}