import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/button.salvar.dart';
import 'package:mobile/app/global/components/scaffold.crud.dart';
import 'package:mobile/app/global/components/text.form.field.dart';
import 'package:mobile/app/modules/user/register/user.controller.dart';

class UserRegisterPage extends GetView<UserRegisterController> {
  const UserRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DwScaffoldCrud(
      title: "Cadastrar usuário",
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(height: 65),
            DwTextFormField(
                label: "Nome completo:", controll: controller.password),
            DwTextFormField(label: "E-mail:", controll: controller.email),
            DwTextFormField(
                label: "Senha:",
                controll: controller.password,
                isPassword: true),
            DwTextFormField(
              label: "Confirmar senha:",
              controll: controller.confirmPassword,
              isPassword: true,
              funValidarCampo: controller.validarCampoConfirmarSenha,
            ),
            const SizedBox(height: 20),
            DwButtonSalvar(funOnTap: () => controller.cadastrarUsuario()),
          ],
        ),
      ),
    );
  }
}
