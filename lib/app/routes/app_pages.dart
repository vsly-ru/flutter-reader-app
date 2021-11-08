import 'package:get/get.dart';

import 'package:elisbetlee/app/modules/home/bindings/home_binding.dart';
import 'package:elisbetlee/app/modules/home/views/home_view.dart';
import 'package:elisbetlee/app/modules/read/bindings/read_binding.dart';
import 'package:elisbetlee/app/modules/read/views/read_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.READ,
      page: () => ReadView(),
      binding: ReadBinding(),
    ),
  ];
}
