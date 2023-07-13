import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/widgets.dart';
import 'package:reader_app/shared/constants.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Sales Analytics',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            RevenueRange(
              height: height,
              width: width,
            ),
            SizedBox(
              height: height * 0.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BarChart(
                    BarChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                            )),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false))),
                        borderData: FlBorderData(
                          border: const Border(
                            top: BorderSide.none,
                            right: BorderSide(width: 0.5),
                            left: BorderSide(width: 0.5),
                            bottom: BorderSide(width: 0.5),
                          ),
                        ),
                        groupsSpace: 10,
                        barGroups: [
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                toY: 50,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                toY: 30,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                toY: 20,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                toY: 10,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                                toY: 15,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(
                                toY: 25,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 7, barRods: [
                            BarChartRodData(
                                toY: 72,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 8, barRods: [
                            BarChartRodData(
                                toY: 80,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 9, barRods: [
                            BarChartRodData(
                                toY: 60,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 10, barRods: [
                            BarChartRodData(
                                toY: 10,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 11, barRods: [
                            BarChartRodData(
                                toY: 30,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                          BarChartGroupData(x: 12, barRods: [
                            BarChartRodData(
                                toY: 10,
                                fromY: 0,
                                width: 15,
                                color: Palette.primary)
                          ]),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'JAN';
        break;
      case 2:
        text = 'FEB';
        break;
      case 3:
        text = 'MAR';
        break;
      case 4:
        text = 'APR';
        break;
      case 5:
        text = 'MAY';
        break;
      case 6:
        text = 'JUN';
        break;
      case 7:
        text = 'JUL';
        break;
      case 8:
        text = 'AUG';
        break;
      case 9:
        text = 'SEP';
        break;
      case 10:
        text = 'OCT';
        break;
      case 11:
        text = 'NOV';
        break;
      case 12:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}
