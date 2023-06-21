import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/initial/initial.binding.dart';
import 'package:mobile/app/modules/initial/initial.page.dart';
import 'package:mobile/app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pisiculturas',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: InitialBinding(),
      home: InitialPage(),
      getPages: AppPages.pages,
    ),
  );
}
