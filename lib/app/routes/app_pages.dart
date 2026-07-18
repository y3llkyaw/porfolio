import 'package:get/get.dart';
import 'package:porfolio_yhk/app/bindings/admin_binding.dart';
import 'package:porfolio_yhk/app/bindings/admin_home_page_binding.dart';
import 'package:porfolio_yhk/app/routes/middlewares/admin_auth_middleware.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_home_page/admin_home_page.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_login_page.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/privacy_policy/privacy_policy_page.dart';
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
      name: AppRoutes.ADMIN_HOME,
      page: () => AdminHomePage(),
      binding: AdminHomePageBinding(),
      transition: _defaultTransition,
      middlewares: [
        AdminAuthMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.ADMIN,
      page: () => AdminLoginPage(),
      binding: AdminBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SPLIT_EVENLY_PRIVACY_POLICY,
      page: () => const PrivacyPolicyPage(),
      transition: _defaultTransition,
    ),
  ];
}
