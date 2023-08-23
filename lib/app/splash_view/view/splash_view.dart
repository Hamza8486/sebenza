import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/home_view.dart';
import 'package:sebenza/app/authentication/account_type.dart';
import 'package:sebenza/app/authentication/login.dart';
import 'package:sebenza/app/user_home/home/user_home.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/helper_function.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String id = "";


  @override
  void initState() {
    super.initState();
    HelperFunctions.getFromPreference("id").then((value) {
      setState(() {
        id = value;
      });
      log(id);
      moveToNext();
    });
  }

  void moveToNext() {
    Timer(const Duration(seconds: 3), () {
      if (id != "") {
        Get.offAll(()=>UserHome(),
        transition: Transition.cupertinoDialog
        );

      } else {
        Get.offAll(()=>AccountType(),
        transition: Transition.cupertinoDialog
        );

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.secColor,
        body: Center(child: Image.asset("assets/images/logo.png",height: Get.height*0.057,)));
  }
}
