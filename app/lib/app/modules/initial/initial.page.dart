import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/text.dart';
import 'package:mobile/app/modules/home/home.page.dart';
import 'package:mobile/app/modules/initial/initial.controller.dart';
import 'package:mobile/app/theme/theme.dart';

import '../../global/components/text.click.dart';

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
            splash: 'assets/logo.png',
            nextScreen: HomePage(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.scale,
          ),
          LayoutBuilder(builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: constraints.maxHeight * .1),
                Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.cover,
                  height: constraints.maxHeight * .25,
                  width: constraints.maxWidth * .25,
                ),
                const DwText(
                    lbl: "  Bem vindo", fontSize: 30, cor: Colors.blue),
                SizedBox(height: constraints.maxHeight * .35),
                DwTextClick(
                  lbl: 'www.dwsoftsolucoes.com.br',
                  fontSize: 22,
                  cor: Colors.blue,
                  fun: () => {},
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
