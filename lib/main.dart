import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/views/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      color: AppColors.background,
      child: MaterialApp(
        onGenerateRoute: generateRoute,
        initialRoute: "/login_screen",
        debugShowCheckedModeBanner: false,
        title: 'SmartPay',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          backgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: AppColors.background,
          ),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen()
      ),
    );
  }
}
