import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/widgets.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
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
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          RevenueRange(
            height: height,
            width: width,
          ),
           Expanded(
             child: LineChart(
             LineChartData(
                   lineTouchData: LineTouchData(
                   handleBuiltInTouches: true,
                   touchTooltipData: LineTouchTooltipData(
                     tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                   ),
                 ),
                   gridData: const FlGridData(show: false),
                   titlesData:const  FlTitlesData(),
                   minX: 0,
                   maxX: 14,
                   maxY: 6,
                   minY: 0,
                 ),
               duration: const Duration(milliseconds: 250),
              
             
                     ),
           ),
        ],
      ),
    );
  }

  
}
