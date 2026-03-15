import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/permission_handler.dart';
import '../../../app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final StorageService _storageService;

  OnboardingController(this._storageService);

  var currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      finishOnboarding();
    }
  }

  void skip() {
    finishOnboarding();
  }

  Future<void> finishOnboarding() async {
    // Request permissions
    bool storageGranted = await AppPermissionHandler.requestStoragePermission();
    if (storageGranted) {
      await AppPermissionHandler.requestNotificationPermission();
      
      await _storageService.setFirstLaunch(false);
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.snackbar('Permission Required', 'Storage permission is required to manage screenshots.');
    }
  }
}
