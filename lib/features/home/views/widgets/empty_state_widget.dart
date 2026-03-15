import 'package:flutter/material.dart';
import '../../../../app/theme/app_typography.dart';
import 'package:gap/gap.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;

  const EmptyStateWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Using a placeholder Lottie file, you will need to add an actual animation
          // Lottie.asset('assets/animations/empty_state.json', height: 150),
          const Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
          const Gap(16),
          Text(message, style: AppTypography.bodyLarge),
        ],
      ),
    );
  }
}
