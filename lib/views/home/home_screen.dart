import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/colors.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/core/viewmodels/home_vm.dart';
import 'package:smartpay_ui/views/base_view.dart';

import '../../app/config/size_config.dart';
import '../../app/styles.dart';
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
    return BaseView(builder: (_, HomeViewModel model, __){
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
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
                      child: Text("Secret Message"),
                    )
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