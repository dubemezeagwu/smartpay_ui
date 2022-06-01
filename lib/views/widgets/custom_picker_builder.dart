import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/styles.dart';

Widget customPickerBuilder (BuildContext context, CountryCode countryCode){
  return SizedBox(
    child: Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 32.w,
          child: Image.asset(
              countryCode.flagUri.toString(),
            package: 'country_list_pick',
          ),
        ),
        SizedBox(width: 16.h,),
        Text(countryCode.code.toString(), style: regularGrey16,),
        SizedBox(width: 16.h,),
        Text(countryCode.name.toString(), style: boldBlack16,)
      ],
    ),
  );
}