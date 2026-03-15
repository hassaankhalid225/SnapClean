import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import '../core/services/storage_service.dart';
import 'bindings/initial_binding.dart';

class SnapCleanApp extends StatelessWidget {
  const SnapCleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storageService = Get.find<StorageService>();
    final isFirstLaunch = storageService.isFirstLaunch;

    return GetMaterialApp(
      title: 'SnapClean',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Switchable from Settings
      initialBinding: InitialBinding(),
      initialRoute: isFirstLaunch ? AppRoutes.ONBOARDING : AppRoutes.HOME,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
    );
  }
}
