import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:spotlas/routes/app_routes.dart';

import 'cores/apis.dart';
import 'cores/color_constant.dart';
import 'cores/helpers.dart';

MaterialColor? mainAppColor;
Helpers mainHelpers = Helpers();
API api =  API();
Helpers helpers =  Helpers();


void main() {
  WidgetsFlutterBinding.ensureInitialized();


  mainHelpers.getMaterialColor(0, 0, 0).then((value) => mainAppColor = value);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        primarySwatch: mainAppColor,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      locale: Get.deviceLocale,
      //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'Spotlas',

      initialRoute: AppRoutes.mainScreen,
      getPages: AppRoutes.pages,
    );
  }
}


