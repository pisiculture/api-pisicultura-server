import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/user/auth/auth.controller.dart';
import 'package:mobile/app/routes/app_pages.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().primaryColor,
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
                    backgroundColor: ThemeData().primaryColor,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                      colorBlendMode: BlendMode.clear,
                      color: ThemeData().badgeTheme.backgroundColor,
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
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.blue.withOpacity(0.12);
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.createUser),
                    child: const Text("Cadastrar"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
