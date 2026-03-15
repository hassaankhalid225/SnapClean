import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../domain/entities/screenshot_entity.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../shared/widgets/custom_button.dart';
import 'package:gap/gap.dart';

class DecisionBottomSheet extends StatelessWidget {
  final ScreenshotEntity screenshot;
  final VoidCallback onKeep;
  final VoidCallback onDelete;

  const DecisionBottomSheet({
    super.key,
    required this.screenshot,
    required this.onKeep,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppDimensions.radiusExtraLarge)),
      ),
      padding: const EdgeInsets.all(AppDimensions.spacing24),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(2))),
            const Gap(16),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
              child: Image.file(
                File(screenshot.filePath),
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 250),
              ),
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Size: ${FileUtils.formatBytes(screenshot.fileSize, 2)}', style: AppTypography.bodyMedium),
                    Text('Folder: Screenshots', style: AppTypography.bodySmall),
                  ],
                ),
                Text(DateFormatter.formatElapsedTime(screenshot.createdAt), style: AppTypography.bodyMedium),
              ],
            ),
            const Gap(32),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Keep',
                    color: AppColors.keepGreen,
                    onPressed: onKeep,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: CustomButton(
                    text: 'Delete',
                    color: AppColors.deleteRed,
                    onPressed: onDelete,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
