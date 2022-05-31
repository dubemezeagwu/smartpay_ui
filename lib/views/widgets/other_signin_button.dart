import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay_ui/app/app_assets.dart';
import 'package:smartpay_ui/app/config/extensions.dart';

import '../../app/colors.dart';

Widget otherSignInButton (String name){
  return GestureDetector(
    onTap: (){},
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.grey,
              width: 1.w
          )
      ),
      height: 56.h,
      width: 155.w,
      child: Center(
        child: SvgPicture.asset(name),
      ),
    ),
  );
}