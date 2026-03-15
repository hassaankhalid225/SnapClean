import 'package:flutter/material.dart';
import '../../../../app/theme/app_typography.dart';
import 'package:gap/gap.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String animationPath;

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.animationPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Using a placeholder icon since Lottie files may not exist initially
          const Icon(Icons.screen_search_desktop_outlined, size: 150, color: Colors.blueAccent),
          // Lottie.asset(animationPath, height: 250),
          const Gap(40),
          Text(title, style: AppTypography.display.copyWith(fontSize: 28), textAlign: TextAlign.center),
          const Gap(16),
          Text(
            subtitle,
            style: AppTypography.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
