import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/analytics_controller.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/utils/file_utils.dart';
import 'widgets/stat_card.dart';
import 'widgets/weekly_chart.dart';
import 'package:gap/gap.dart';

class AnalyticsScreen extends GetView<AnalyticsController> {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Screenshot Stats'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    StatCard(
                      title: 'Total Taken',
                      value: '${controller.totalTaken.value}',
                      icon: Icons.camera_alt,
                      color: AppColors.primary,
                    ),
                    StatCard(
                      title: 'Deleted',
                      value: '${controller.totalDeleted.value}',
                      icon: Icons.delete_outline,
                      color: AppColors.deleteRed,
                    ),
                    StatCard(
                      title: 'Storage Freed',
                      value: FileUtils.formatBytes(controller.storageFreed.value, 1),
                      icon: Icons.storage,
                      color: AppColors.keepGreen,
                    ),
                    const StatCard(
                      title: 'Streak',
                      value: '12 days',
                      icon: Icons.local_fire_department,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
                const Gap(32),
                Text('Weekly Activity', style: AppTypography.heading),
                const Gap(16),
                const SizedBox(
                  height: 300,
                  child: WeeklyChart(),
                ),
                const Gap(32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.keepGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.keepGreen.withOpacity(0.5)),
                  ),
                  child: Center(
                    child: Text(
                      'You saved ${FileUtils.formatBytes(controller.storageFreed.value, 1)} of storage this week! 🚀',
                      style: AppTypography.subheading.copyWith(color: AppColors.keepGreen),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}
