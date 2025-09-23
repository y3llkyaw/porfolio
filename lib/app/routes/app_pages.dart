import 'package:get/get.dart';
import 'package:porfolio_yhk/app/bindings/admin_binding.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_page.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.noTransition;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ADMIN,
      page: () => AdminPage(),
      binding: AdminBinding(),
      transition: _defaultTransition,
    )
  ];
}
