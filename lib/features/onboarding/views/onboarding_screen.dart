import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../shared/widgets/custom_button.dart';
import 'widgets/onboarding_page_widget.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: controller.skip,
                child: Text('Skip', style: AppTypography.button.copyWith(color: AppColors.textSecondary)),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                physics: const BouncingScrollPhysics(),
                children: const [
                  OnboardingPageWidget(
                    title: 'Smart Screenshot Detection',
                    subtitle: 'Automatically detect and track new screenshots as you take them.',
                    animationPath: 'assets/animations/onboarding_1.json',
                  ),
                  OnboardingPageWidget(
                    title: 'Timely Reminders',
                    subtitle: 'Get notified to keep or delete screenshots before they pile up.',
                    animationPath: 'assets/animations/onboarding_2.json',
                  ),
                  OnboardingPageWidget(
                    title: 'You\'re in Control',
                    subtitle: 'Keep the important ones, delete the rest with one tap.',
                    animationPath: 'assets/animations/onboarding_3.json',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Row(
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 8,
                          width: controller.currentPage.value == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index ? AppColors.primary : AppColors.lightBorder,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => CustomButton(
                      width: 140,
                      text: controller.currentPage.value == 2 ? 'Get Started' : 'Next',
                      onPressed: controller.nextPage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
