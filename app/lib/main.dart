import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/user/auth/auth.binding.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pisicultura',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.auth,
      initialBinding: AuthBinding(),
      //home: InitialPage(),
      getPages: AppPages.pages,
    ),
  );
}
