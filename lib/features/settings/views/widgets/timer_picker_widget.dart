import 'package:flutter/material.dart';
import '../../../../app/theme/app_typography.dart';
import 'package:gap/gap.dart';

class TimerPickerWidget extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelected;

  const TimerPickerWidget({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select an option', style: AppTypography.heading),
        const Gap(16),
        ...options.map((option) => RadioListTile<String>(
          title: Text(option, style: AppTypography.bodyLarge),
          value: option,
          groupValue: selectedOption,
          onChanged: (val) {
            if (val != null) onSelected(val);
          },
        )),
      ],
    );
  }
}
