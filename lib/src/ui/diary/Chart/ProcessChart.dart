// import 'package:flutter/material.dart';

// class ProcessChart extends StatelessWidget{
//   // for example number days of month will be assign 31
//   static final NUMBER_DAYS_OF_MONTH = 31;
  
//   final List<WeightEntry> entries;

//   ProcessChart(this.entries);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return CustomPaint(
//       painter: ChartPainter(_prepareEntryList(entries)),
//     );
//   }

//   List<WeightEntry> _prepareEntryList(List<WeightEntry> initialEntries){
//     DateTime beginningDate = _getStartDateOfChart();
//     List<WeightEntry> entries = initialEntries.where(
//       (entry) => entry.dateTime.isAfter(beginningDate)
//     ).toList();
//   }

//   _getStartDateOfChart(){}
// }

// class WeightEntry{}