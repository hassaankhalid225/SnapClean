import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pending_controller.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../app/theme/app_typography.dart';
import '../../home/views/widgets/empty_state_widget.dart';
import 'widgets/pending_screenshot_tile.dart';

class PendingScreen extends GetView<PendingController> {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Review'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.loadData,
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pendingScreenshots.isEmpty) {
          return const EmptyStateWidget('All clean! No pending screenshots.');
        }

        return RefreshIndicator(
          onRefresh: controller.loadData,
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: controller.pendingScreenshots.length,
            itemBuilder: (context, index) {
              final screenshot = controller.pendingScreenshots[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: PendingScreenshotTile(
                  screenshot: screenshot,
                  onKeep: () => controller.keepScreenshot(screenshot.id),
                  onDelete: () => controller.deleteScreenshot(screenshot.id),
                ),
              );
            },
          ),
        );
      }),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
