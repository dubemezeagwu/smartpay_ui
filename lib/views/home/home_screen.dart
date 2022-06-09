import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/routes/routes.dart';
import 'package:smartpay_ui/core/viewmodels/auth_vm.dart';
import 'package:smartpay_ui/core/viewmodels/home_vm.dart';
import 'package:smartpay_ui/locator.dart';
import 'package:smartpay_ui/views/base_view.dart';
import 'package:smartpay_ui/views/widgets/custom_black_button.dart';

import '../../app/config/size_config.dart';
import '../../app/styles.dart';
import '../login/login_screen.dart';
import '../widgets/appbar_back_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final AuthViewModel _authViewModel = Provider.of<AuthViewModel>(context);
    return BaseView(onModelReady: (HomeViewModel model) => model.getMessage() ,builder: (_, HomeViewModel model, __){
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: (){
                  _authViewModel.logout({});
                  routeTo(context, LoginScreen());
                },
                  child: Icon(Icons.door_back_door_outlined,color: AppColors.primary,)
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(model.message.toString()),
                    ),
                    SizedBox(height: 100.h,),
                    customBlackButton("Get secret message", true, onTap: (){
                      model.getMessage();
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}