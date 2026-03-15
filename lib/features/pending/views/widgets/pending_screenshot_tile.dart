import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../domain/entities/screenshot_entity.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/date_formatter.dart';
import 'package:gap/gap.dart';
import 'decision_bottom_sheet.dart';

class PendingScreenshotTile extends StatelessWidget {
  final ScreenshotEntity screenshot;
  final VoidCallback onKeep;
  final VoidCallback onDelete;

  const PendingScreenshotTile({
    super.key,
    required this.screenshot,
    required this.onKeep,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(screenshot.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onKeep(),
            backgroundColor: AppColors.keepGreen,
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: 'Keep',
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: AppColors.deleteRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
        ],
      ),
      child: Material(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (ctx) => DecisionBottomSheet(
                screenshot: screenshot,
                onKeep: () {
                  Navigator.pop(ctx);
                  onKeep();
                },
                onDelete: () {
                  Navigator.pop(ctx);
                  onDelete();
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                  child: Image.file(
                    File(screenshot.filePath),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(
                      width: 60, height: 60, child: Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        screenshot.fileName,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(4),
                      Text(
                        DateFormatter.formatElapsedTime(screenshot.createdAt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
