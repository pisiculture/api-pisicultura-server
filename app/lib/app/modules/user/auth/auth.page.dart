import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/button.dart';
import 'package:mobile/app/global/components/button.rota.dart';
import 'package:mobile/app/global/components/text.click.dart';
import 'package:mobile/app/global/components/text.form.field.dart';
import 'package:mobile/app/modules/user/auth/auth.controller.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/theme/theme.dart';

class AuthPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData().backgroundColor,
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
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                      colorBlendMode: BlendMode.color,
                      color: appThemeData().backgroundColor,
                      height: 200,
                      width: 200,
                    ),
                    minRadius: 70,
                  ),
                  const SizedBox(height: 20),
                  DwTextFormField(
                    controll: controller.username,
                    label: "E-mail",
                  ),
                  DwTextFormField(
                    controll: controller.password,
                    label: "Senha de acesso",
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  DwButton(
                    cor: Colors.blue,
                    label: "Acessar",
                    funOnTap: () => controller.validate(),
                    icon: Icons.playlist_add_check_outlined,
                  ),
                  DwButtonRota(
                    corButton: Colors.green,
                    label: "Cadastrar",
                    rotaOnPress: AppRoutes.createUser,
                    icon: Icons.group_add_outlined,
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
