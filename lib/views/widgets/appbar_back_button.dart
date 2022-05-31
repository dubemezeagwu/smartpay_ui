import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/config/extensions.dart';

import '../../app/colors.dart';

Widget appBarBackButton (){
  return GestureDetector(
    onTap: (){},
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.grey,
              width: 1.w
          )
      ),
      height: 40.h,
      width: 40.w,
      child: const Center(
        child: Icon(
          Icons.chevron_left,
          size: 24,
          color: AppColors.black,
        ),
      ),
    ),
  );
}