import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/common_goal/components/common_goal_description.dart';
import 'package:khorsand87/moduls/common_goal/components/indicator.dart';
import 'package:khorsand87/moduls/common_goal/components/personal_goal_indicator.dart';

class PieCharts extends StatefulWidget {
  const PieCharts({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 0),
        const PersonalGoalIndicator(),
        const SizedBox(height: 20),
        const CommonGoalDescription(),
        const Spacer(),
        Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(
                  color: Colors.red.withOpacity(0.9),
                  text: 'پرداخت نشده',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Indicator(
                  color: Colors.yellow,
                  text: 'حسین',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple.withOpacity(0.5),
                  text: 'علی',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Indicator(
                  color: Colors.green,
                  text: 'محمد',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red.withOpacity(0.9),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple.withOpacity(0.5),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
