import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/home_view.dart';
import 'package:sebenza/app/authentication/sign_up.dart';
import 'package:sebenza/app/splash_view/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: GlobalVariable.navState,
      debugShowCheckedModeBanner: false,
      title: 'Sebenza',
      home: SplashView(),
    );
  }
}




/// Global variables
/// * [GlobalKey<NavigatorState>]
class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  /// [navState] usage can be found in [notification_notifier.dart] file.
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
