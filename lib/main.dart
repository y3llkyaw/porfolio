import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/ui/layouts/main/main_layout.dart';
import 'app/ui/theme/themes.dart';
import 'app/controllers/darkmode_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await DependecyInjection.init();
  Get.put(DarkModeController()); // Inject DarkModeController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkModeController = Get.put(DarkModeController());
    return ScreenUtilInit(
      builder: (_, __) {
        return Obx(
          () => GetMaterialApp(
            title: 'Porfolio',
            debugShowCheckedModeBanner: false,
            theme: Themes().lightTheme,
            darkTheme: Themes().darkTheme,
            themeMode: darkModeController.themeMode,
            translations: Translation(),
            locale: const Locale('en'),
            fallbackLocale: const Locale('en'),
            initialRoute: AppRoutes.HOME,
            unknownRoute: AppPages.unknownRoutePage,
            getPages: AppPages.pages,
            builder: (_, child) {
              return MainLayout(child: child!);
            },
          ),
        );
      },
      designSize: const Size(411, 823),
    );
  }
}
