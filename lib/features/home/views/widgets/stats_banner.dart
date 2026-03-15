import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/file_utils.dart';
import 'package:gap/gap.dart';

class StatsBanner extends StatelessWidget {
  final int totalTaken;
  final int storageFreed;
  final int pendingCount;

  const StatsBanner({
    super.key,
    required this.totalTaken,
    required this.storageFreed,
    required this.pendingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: AppColors.primaryLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back!', style: AppTypography.heading),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(label: 'Saved', value: '$totalTaken'),
              _StatItem(label: 'Freed', value: FileUtils.formatBytes(storageFreed, 1)),
              _StatItem(label: 'Pending', value: '$pendingCount', valueColor: AppColors.pendingAmber),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _StatItem({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1000),
          builder: (context, val, child) {
            return Transform.scale(
              scale: val,
              child: Opacity(
                opacity: val,
                child: Text(
                  value,
                  style: AppTypography.display.copyWith(fontSize: 24, color: valueColor ?? AppColors.primary),
                ),
              ),
            );
          },
        ),
        const Gap(4),
        Text(label, style: AppTypography.bodySmall),
      ],
    );
  }
}
