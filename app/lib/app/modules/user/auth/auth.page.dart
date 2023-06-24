import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/text.click.dart';
import 'package:mobile/app/modules/user/auth/auth.controller.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/theme/theme.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData().primaryColor,
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (_, contenteins) {
            return Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.05),
                  CircleAvatar(
                    minRadius: 70,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                      colorBlendMode: BlendMode.clear,
                      color: appThemeData().badgeTheme.backgroundColor,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      TextFormField(
                        controller: controller.username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    child: const Text("Acessar"),
                    onPressed: () => controller.validate(),
                  ),
                  TextButton.icon(
                    onPressed: () => Get.toNamed(AppRoutes.createUser),
                    label: const Text("Acessar"),
                    icon: const Icon(Icons.abc_sharp),
                  ),
                  const SizedBox(height: 10),
                  DwTextClick(
                    lbl: "Esqueceu sua senha?",
                    fun: controller.sendmail,
                    fontSize: 18,
                    cor: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
