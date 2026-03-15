import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/home/bindings/home_binding.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_screen.dart';
import '../../features/pending/bindings/pending_binding.dart';
import '../../features/pending/views/pending_screen.dart';
import '../../features/gallery/bindings/gallery_binding.dart';
import '../../features/gallery/views/gallery_screen.dart';
import '../../features/analytics/bindings/analytics_binding.dart';
import '../../features/analytics/views/analytics_screen.dart';
import '../../features/settings/bindings/settings_binding.dart';
import '../../features/settings/views/settings_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PENDING,
      page: () => const PendingScreen(),
      binding: PendingBinding(),
    ),
    GetPage(
      name: AppRoutes.GALLERY,
      page: () => const GalleryScreen(),
      binding: GalleryBinding(),
    ),
    GetPage(
      name: AppRoutes.ANALYTICS,
      page: () => const AnalyticsScreen(),
      binding: AnalyticsBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
  ];
}
