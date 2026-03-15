import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'widgets/settings_tile.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Automation'),
            Obx(() => SettingsTile(
                  title: 'Auto-Delete Mode',
                  subtitle: 'Automatically delete un-reviewed screenshots',
                  trailing: Switch(
                    value: controller.isAutoDeleteEnabled.value,
                    onChanged: controller.toggleAutoDelete,
                    activeColor: AppColors.primary,
                  ),
                )),
            Obx(() {
              if (controller.isAutoDeleteEnabled.value) {
                return SettingsTile(
                  title: 'Auto-Delete Delay',
                  subtitle: controller.autoDeleteDelay.value,
                  onTap: () {}, // Would show custom picker BottomSheet
                );
              }
              return const SizedBox.shrink();
            }),
            Obx(() => SettingsTile(
                  title: 'Reminder Timer',
                  subtitle: controller.reminderTimer.value,
                  onTap: () {}, // Would show timer picker BottomSheet
                )),
            const Gap(24),
            
            _buildSectionHeader('Notifications'),
            Obx(() => SettingsTile(
                  title: 'Enable Notifications',
                  trailing: Switch(
                    value: controller.areNotificationsEnabled.value,
                    onChanged: controller.toggleNotifications,
                    activeColor: AppColors.primary,
                  ),
                )),
            const Gap(24),
            
            _buildSectionHeader('Appearance'),
            Obx(() => SettingsTile(
                  title: 'Dark Mode',
                  trailing: Switch(
                    value: controller.isDarkMode.value,
                    onChanged: controller.toggleTheme,
                    activeColor: AppColors.primary,
                  ),
                )),
            const Gap(24),
            
            _buildSectionHeader('Storage'),
            SettingsTile(
              title: 'Scan Old Screenshots',
              subtitle: 'Find untracked screenshots in gallery',
              icon: Icons.search,
              onTap: controller.scanOldScreenshots,
            ),
            SettingsTile(
              title: 'Clear History',
              icon: Icons.delete_forever,
              iconColor: AppColors.deleteRed,
              onTap: controller.clearHistory,
            ),
            const Gap(24),
            
            _buildSectionHeader('About'),
            const SettingsTile(title: 'App Version', subtitle: '1.0.0'),
            SettingsTile(title: 'Privacy Policy', onTap: () {}),
            SettingsTile(title: 'Rate the App', onTap: () {}),
            const Gap(32),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: AppTypography.heading.copyWith(fontSize: 18, color: AppColors.primary),
      ),
    );
  }
}
