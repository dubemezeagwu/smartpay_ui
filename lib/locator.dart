import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smartpay_ui/core/api/auth_api.dart';
import 'package:smartpay_ui/core/api/home_api.dart';
import 'package:smartpay_ui/core/viewmodels/auth_vm.dart';
import 'package:smartpay_ui/core/viewmodels/home_vm.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<AuthAPI>(() => AuthAPI());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());

  locator.registerLazySingleton<HomeAPI>(() => HomeAPI());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
];