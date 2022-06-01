import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_ui/views/login/login_screen.dart';
import 'package:smartpay_ui/views/login/new_password_screen.dart';
import 'package:smartpay_ui/views/login/otp_auth_screen.dart';
import 'package:smartpay_ui/views/login/password_recovery_screen.dart';
import 'package:smartpay_ui/views/login/reset_password_success_screen.dart';
import 'package:smartpay_ui/views/registration/country_residence_screen.dart';
import 'package:smartpay_ui/views/registration/create_pin_screen.dart';
import 'package:smartpay_ui/views/registration/signup_confirmation_screen.dart';
import 'package:smartpay_ui/views/registration/signup_screen.dart';

import '../../views/login/password_recovery_screen.dart';


Route?  generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const LoginScreen(),
        args: settings.arguments,
      );
    case '/password_recovery_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const PasswordRecoveryScreen(),
        args: settings.arguments,
      );
    case '/otp_auth_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const OTPAuthenticationScreen(),
        args: settings.arguments,
      );
    case '/new_password_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const NewPasswordScreen(),
        args: settings.arguments,
      );
    case '/reset_password_success_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const ResetPasswordSuccessScreen(),
        args: settings.arguments,
      );
    case '/signup_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const SignUpScreen(),
        args: settings.arguments,
      );
    case '/country_residence_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const CountryResidenceScreen(),
        args: settings.arguments,
      );
    case '/create_pin_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const CreatePINScreen(),
        args: settings.arguments,
      );
    case '/signup_confirmation_screen':
      return _getPageRoute(
        routeName: settings.name,
        view: const SignUpConfirmationScreen(),
        args: settings.arguments,
      );
    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute({String? routeName, required Widget view, Object? args}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (context) => view);
}

void routeTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<void>(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void routeToReplace(BuildContext context, Widget view) {
  Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) => view),
          (Route<void> route) => false);
}