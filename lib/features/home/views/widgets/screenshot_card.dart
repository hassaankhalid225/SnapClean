import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../domain/entities/screenshot_entity.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/file_utils.dart';
import 'package:gap/gap.dart';

class ScreenshotCard extends StatefulWidget {
  final ScreenshotEntity screenshot;
  final VoidCallback onKeep;
  final VoidCallback onDelete;
  final Duration delay;

  const ScreenshotCard({
    super.key,
    required this.screenshot,
    required this.onKeep,
    required this.onDelete,
    required this.delay,
  });

  @override
  State<ScreenshotCard> createState() => _ScreenshotCardState();
}

class _ScreenshotCardState extends State<ScreenshotCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          border: Border.all(color: (Theme.of(context).cardTheme.shape as RoundedRectangleBorder?)?.side.color ?? Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimensions.radiusLarge)),
                child: Image.file(
                  File(widget.screenshot.filePath),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.image_not_supported)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormatter.formatElapsedTime(widget.screenshot.createdAt),
                    style: AppTypography.bodySmall,
                  ),
                  Text(
                    FileUtils.formatBytes(widget.screenshot.fileSize, 2),
                    style: AppTypography.mono.copyWith(fontSize: 10, color: AppColors.textSecondary),
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: widget.onKeep,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.keepGreen,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                          child: const Text('Keep', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                      const Gap(4),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: widget.onDelete,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.deleteRed,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                          child: const Text('Delete', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
