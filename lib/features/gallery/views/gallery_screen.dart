import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../home/views/widgets/empty_state_widget.dart';
import 'widgets/screenshot_grid_item.dart';

class GalleryScreen extends GetView<GalleryController> {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          Obx(() {
            if (controller.selectedIds.isNotEmpty) {
              return IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: controller.deleteSelected,
              );
            }
            return IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Future filter options
              },
            );
          })
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.keptScreenshots.isEmpty) {
          return const EmptyStateWidget('Your gallery is beautifully empty.');
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: controller.keptScreenshots.length,
          itemBuilder: (context, index) {
            final screenshot = controller.keptScreenshots[index];
            return Obx(() {
              final isSelected = controller.selectedIds.contains(screenshot.id);
              return ScreenshotGridItem(
                screenshot: screenshot,
                isSelected: isSelected,
                onTap: () {
                  if (controller.selectedIds.isNotEmpty) {
                    controller.toggleSelection(screenshot.id);
                  } else {
                    // Open full screen preview
                  }
                },
                onLongPress: () => controller.toggleSelection(screenshot.id),
              );
            });
          },
        );
      }),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
