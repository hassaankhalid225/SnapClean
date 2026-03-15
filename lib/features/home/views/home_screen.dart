import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../app/theme/app_typography.dart';
import 'widgets/stats_banner.dart';
import 'widgets/empty_state_widget.dart';
import 'widgets/screenshot_card.dart';
import 'package:gap/gap.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SnapClean',
          style: AppTypography.display.copyWith(fontSize: 28),
        ),
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

        return RefreshIndicator(
          onRefresh: controller.loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   StatsBanner(
                     totalTaken: controller.totalTaken.value,
                     storageFreed: controller.storageFreed.value,
                     pendingCount: controller.pendingCount.value,
                   ),
                   const Gap(24),
                   Text('Pending Review', style: AppTypography.subheading),
                   const Gap(16),
                   if (controller.pendingScreenshots.isEmpty)
                     const EmptyStateWidget('All clean! No pending screenshots.')
                   else
                     SizedBox(
                       height: 250,
                       child: ListView.separated(
                         scrollDirection: Axis.horizontal,
                         itemCount: controller.pendingScreenshots.length,
                         separatorBuilder: (_, __) => const Gap(16),
                         itemBuilder: (context, index) {
                           final screenshot = controller.pendingScreenshots[index];
                           return ScreenshotCard(
                             screenshot: screenshot,
                             onKeep: () => controller.keepScreenshot(screenshot.id),
                             onDelete: () => controller.deleteScreenshot(screenshot.id),
                             delay: Duration(milliseconds: index * 80),
                           );
                         },
                       ),
                     ),
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger manual scan logic here
        },
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
