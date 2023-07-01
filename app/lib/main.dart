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
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 8, 8, 12),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF171821),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.green,
        ),
      ),
      initialRoute: AppRoutes.initial,
      initialBinding: InitBinding(),
      //home: InitialPage(),
      getPages: AppPages.pages,
    ),
  );
}
