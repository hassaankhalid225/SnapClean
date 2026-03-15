import 'package:flutter/material.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_typography.dart';
import 'package:gap/gap.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: (Theme.of(context).cardTheme.shape as RoundedRectangleBorder?)?.side.color ?? Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const Gap(12),
          Text(value, style: AppTypography.display.copyWith(fontSize: 24, color: color)),
          const Gap(4),
          Text(title, style: AppTypography.bodySmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
