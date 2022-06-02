
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import '../../app/styles.dart';
import 'appbar_back_button.dart';

Widget countryListPicker (){
  return CountryListPick(
    appBar: AppBar(
      leading: appBarBackButton(
          onTap: (){
            // Navigator.of(context).pop();
          }),
    ),
    pickerBuilder: (context, CountryCode? countryCode){
      return Row(
          children: [
            SizedBox(
              height: 24.h,
              width: 32.w,
              child: Image.asset(
                countryCode!.flagUri.toString(),
                package: 'country_list_pick',
              ),
            ),
            SizedBox(width: 16.h,),
            Text(countryCode.code.toString(), style: regularGrey16,),
            SizedBox(width: 16.h,),
            Text(countryCode.name.toString(), style: boldBlack16,),
            SizedBox(width: 142.h,),
            const Icon(Icons.keyboard_arrow_down,color: AppColors.black,)
          ],
        );
    },
    theme: CountryTheme(
      isShowFlag: true,
      isShowTitle: true,
      isShowCode: true,
      isDownIcon: true,
      showEnglishName: true,
      labelColor: Colors.blueAccent,
    ),
    onChanged: (CountryCode? code) {
      print(code!.name);
      print(code.code);
      print(code.dialCode);
      print(code.flagUri);
    },
    initialSelection: "+234",
    useUiOverlay: true,
    useSafeArea: true,
  );
}