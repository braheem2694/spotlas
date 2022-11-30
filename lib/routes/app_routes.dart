import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotlas/app/main_screen/main_screen.dart';

import '../app/main_screen/binding/main_binding.dart';

class AppRoutes {
  static String mainScreen = '/main_screen';

  static List<GetPage> pages = [
    GetPage(
      name: mainScreen,
      page: () => MainScreen(),
      bindings: [
        MainScreenBinding(),
      ],
    )
  ];
}
