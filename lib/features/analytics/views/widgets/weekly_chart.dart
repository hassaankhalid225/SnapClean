import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../app/theme/app_colors.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(color: AppColors.textSecondary, fontSize: 10);
                String text;
                switch (value.toInt()) {
                  case 0: text = 'Mon'; break;
                  case 1: text = 'Tue'; break;
                  case 2: text = 'Wed'; break;
                  case 3: text = 'Thu'; break;
                  case 4: text = 'Fri'; break;
                  case 5: text = 'Sat'; break;
                  case 6: text = 'Sun'; break;
                  default: text = ''; break;
                }
                return SideTitleWidget(space: 4, axisSide: meta.axisSide, child: Text(text, style: style));
              },
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          _generateGroupData(0, 10, 4),
          _generateGroupData(1, 14, 5),
          _generateGroupData(2, 5, 2),
          _generateGroupData(3, 20, 15),
          _generateGroupData(4, 8, 3),
          _generateGroupData(5, 25, 10),
          _generateGroupData(6, 12, 6),
        ],
      ),
    );
  }

  BarChartGroupData _generateGroupData(int x, double taken, double deleted) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: taken,
          color: AppColors.primary,
          width: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: deleted,
          color: AppColors.deleteRed,
          width: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
