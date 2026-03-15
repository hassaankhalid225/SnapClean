import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../domain/entities/screenshot_entity.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';

class ScreenshotGridItem extends StatelessWidget {
  final ScreenshotEntity screenshot;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const ScreenshotGridItem({
    super.key,
    required this.screenshot,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 3,
              ),
              image: DecorationImage(
                image: FileImage(File(screenshot.filePath)),
                fit: BoxFit.cover,
                onError: (_, __) => const Icon(Icons.broken_image),
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 16, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
