import 'package:get/get.dart';

import '../modules/initial_screen/initial_screen_binding.dart';
import '../modules/initial_screen/initial_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL_SCREEN,
      page: () => const InitialScreenView(),
      binding: InitialScreenBinding(),
    ),
  ];
}
