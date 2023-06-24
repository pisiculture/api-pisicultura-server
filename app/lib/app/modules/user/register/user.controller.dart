import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/user.model.dart';
import 'package:mobile/app/data/repository/user.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/app/routes/app_pages.dart';

class UserRegisterController extends GetxController {
  final repositoty = Get.find<UserRepository>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  cadastrarUsuario() async {
    if (formKey.currentState!.validate()) {
      if (password.text == confirmPassword.text) {
        User user = User();
        user.setName(name.text);
        user.setEmail(email.text);
        user.setPassword(password.text);
        User newUsuario = await repositoty.post(user);
        // ignore: unnecessary_null_comparison
        newUsuario == null
            ? Get.snackbar("Erro:", 'Não foi possivel concluir o cadastro!')
            : _realizarLoginAposConcluirCadastro(newUsuario);
      } else {
        Get.snackbar("Erro:", 'As senha não correspondem!');
      }
    }
  }

  _realizarLoginAposConcluirCadastro(User user) {
    Get.snackbar('Sucesso!!', 'Seu cadastro foi realizado com sucesso!!');
    System.getInstance().setUser(user);
    Get.offAndToNamed(AppRoutes.home);
  }

  validarCampoConfirmarSenha() {
    if (password.text != confirmPassword.text) {
      return "As senha não correspondem!";
    }
  }
}
