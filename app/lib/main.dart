import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/initial/init.binding.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pisicultura',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.green,
        ),
      ),
      initialRoute: AppRoutes.auth,
      initialBinding: InitBinding(),
      //home: InitialPage(),
      getPages: AppPages.pages,
    ),
  );
}
