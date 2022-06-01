import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_ui/views/login/login_screen.dart';
import 'package:smartpay_ui/views/login/password_recovery_screen.dart';

import '../../views/login/password_recovery_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
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
    default:
      return CupertinoPageRoute<dynamic>(
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
      builder: (_) => view!);
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