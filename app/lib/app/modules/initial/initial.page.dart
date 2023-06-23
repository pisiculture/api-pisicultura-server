import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mobile/app/modules/user/auth/auth.page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/initial/initial.controller.dart';
import 'package:mobile/app/theme/theme.dart';

class InitialPage extends GetView<InitialController> {
  InitialPage({super.key}) {
    controller.auth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData().backgroundColor,
      body: Stack(
        children: <Widget>[
          AnimatedSplashScreen(
            animationDuration: const Duration(seconds: 1),
            splash: 'assets/logo.png',
            nextScreen: const AuthPage(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.rightToLeftWithFade,
          ),
        ],
      ),
    );
  }
}
