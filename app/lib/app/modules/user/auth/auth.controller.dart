import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/repository/user.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final repositoty = Get.find<UserRepository>();
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  validate() {
    if (formKey.currentState!.validate()) {
      if ((email.text != '') && (password.text != '')) {
        repositoty.auth(email.text, password.text).then((value) {
          System.getInstance().setUser(value);
          _saveDataAuthMemory(value);
          Get.offAndToNamed(AppRoutes.home);
        }).catchError((err) {
          Get.snackbar('Erro:',
              'Email ou senha incorreto(s), verifique e tente novamente');
        });
      }
    }
  }

  _saveDataAuthMemory(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', user.email);
    prefs.setString('password', user.password);
    prefs.setString('token', user.token);
  }

  sendmail() {
    Get.defaultDialog(
      title: 'Recuperar senha',
      middleText:
          'Deseja enviar um e-mail para verificação de dados do usuário?',
      textConfirm: 'Enviar',
      textCancel: 'Cancelar',
      backgroundColor: Colors.green[100],
      buttonColor: Colors.green,
      barrierDismissible: false,
      onCancel: () => Get.back(),
      onConfirm: () => _sendmail(),
    );
  }

  _sendmail() async {}
}
