import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:bmicalculator/src/utils/string/index.dart';
import 'package:bmicalculator/src/utils/theme/Diary.dart';
import 'package:bmicalculator/src/models/ModelItemDiary.dart';

class DiaryScreen extends BaseScreen {
  double widthScreen = 0.0;
  double heightScreen = 0.0;

  double widthParent = 0;
  double heightParent = 0;

  // final List<Widget> _contentList = [];

  @override
  Widget onInitBody(BuildContext context) {
    // init item into list widgets

    // // Get width height
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;

    widthParent = widthScreen * factorWidthParent;
    heightParent = heightScreen * factorHeightParent;

    return Container(
      child: Column(
        children: <Widget>[
          HeaderWidget(titleHeader, descTitle, pathIcPlus,_pressButtonFunction(), _backToCalculatorScreen(context)),
          _contentBody(context)
        ],
      ),
    );
  }
/// Function push to Diary screen
  _backToCalculatorScreen(BuildContext context) {
    final String _screenName = './calcualator';
    pushReplaceScreen(context, _screenName);
  }

  _pressButtonFunction() {
    print("Press button function");
  }
  Widget _contentBody(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: heightScreen * factorHeightParentContentBody,
      width: widthScreen * factorWidthParentContentBody,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(color: colorBrContentBody),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _calendar(context),
            _chart(context),
            _noteDesc(context),
            _goalsAndCurrent(context),
            _diaryList(context)
          ],
        ),
      ),
    );
  }

  /// Calendar
  Widget _calendar(BuildContext context) {
    return Container(
      width: widthScreen * factorWidthCalendar,
      height: heightScreen * factorHeightCalendar,
      decoration: BoxDecoration(color: colorBrCalendar),
      child: Row(
        children: <Widget>[
          // Left
          _leftCalendar(),
          // Right
          _rightCalendar()
        ],
      ),
    );
  }

  Widget _leftCalendar() {
    var container = Container(
            height: (heightScreen * 0.1) * 0.5,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(color: colorBrLeftCalendar),
            child: Text(statistic,
                style: TextStyle(color: txtColorTitleLeftCalendar)),
          );
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          // Title
          container,
          // Content
          Container(
            height: (heightScreen * 0.1) * 0.5,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: colorBrContentLeftCalendar),
            child: Text(currentDate, style: TextStyle(color: colorTxtMain)),
          )
        ],
      ),
    );
  }

  Widget _rightCalendar() {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          // Top line
          Container(
            height: (heightScreen * 0.1) * 0.5,
            decoration: BoxDecoration(color: colorBrTopLineRightCalendar),
            child: Row(
              children: <Widget>[
                // Month
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: colorBrMonth),
                    child: 
                    _txtRightCalendar(
                      labelMonth
                    ),
                  ),
                ),
                // Year
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: colorBrYear),
                    child: _txtRightCalendar(labelYear),
                  ),
                ),
                // All
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: colorBrAll),
                    child: _txtRightCalendar(labelAll),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Line - empty
          Container(
            height: (heightScreen * 0.1) * 0.5,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: colorBrBottomLine),
          )
        ],
      ),
    );
  }

  Widget _txtRightCalendar(String txt){
    return Text(
      txt,
      style: TextStyle(
        color: Colors.white
      )
    );
  }

  /// Chart
  Widget _chart(BuildContext context) {
    return Container(
      width: widthScreen * factorWidthChart,
      height: heightScreen * factorHeightChart,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: colorBrChart),
    );
  }

  ///
  /// Description
  Widget _noteDesc(BuildContext context) {
    return Container(
        width: widthScreen * factorWidthNoteDesc,
        height: heightScreen * factorHeightNoteDesc,
        decoration: BoxDecoration(color: colorBrNoteDesc));
  }

  ///
  /// Goal and current weight
  Widget _goalsAndCurrent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: colorBrGoalAndCurrent),
      width: widthParent,
      height: heightParent,
      child: Row(
        children: <Widget>[
          // Left
          _goalView(context, pathBrGoal),
         
          // Right
          _currentView(context, pathBrCurrent)
        ],
      ),
    );
  }

  Widget _goalView(BuildContext context, String _pathBr) {
    return Container(
      width: (widthScreen * 0.9) * 0.5,
      height: heightScreen * 0.2,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          // color: Colors.white
          image: DecorationImage(image: AssetImage(_pathBr))),
      child: Stack(
        children: <Widget>[
          // _backgroundForViewItem(_pathBr),
          _textGoal(),
          _circularChartProcess(),
          _valueOfWeight(),
        ],
      ),
    );
  }

  /// Widgets for goal view
  ///
  /// Text goal
  Widget _textGoal() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: paddingTopGoalAndCurrent, left: paddingLeftGoalAndCurrent, bottom: 0, right: 0),
          child: Text(lblGoal, style: TextStyle()),
        ),
      ],
    );
  }

  /// Value of weight
  Widget _valueOfWeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(color: Colors.blue),
          child: Text("79",
              style: TextStyle(color: colorTxtGoalAndValue, fontSize: fontSizeValueOfWeight)),
        ),
        Container(
          alignment: Alignment.center,
          // color: Colors.red,
          child: Text("kg", style: TextStyle(color: colorTxtMain)),
        ),
      ],
    );
  }

  /// Circular chart
  ///
  // Define circular chart key
  final GlobalKey<AnimatedCircularChartState> _circleChartKey =
      new GlobalKey<AnimatedCircularChartState>();
  // circular chart size
  Size _circleChartSize = const Size(130, 130);
  // circular chart data
  List<CircularStackEntry> _dataChart = <CircularStackEntry>[
    new CircularStackEntry(<CircularSegmentEntry>[
      CircularSegmentEntry(-33.33, Colors.blue, rankKey: 'Completed'),
      CircularSegmentEntry(66.67, Colors.transparent, rankKey: 'remaining')
    ], rankKey: 'Process'),
  ];

  Widget _circularChartProcess() {
    return Container(
        alignment: Alignment.center,
        child: AnimatedCircularChart(
          size: _circleChartSize,
          key: _circleChartKey,
          chartType: CircularChartType.Radial,
          initialChartData: _dataChart,
          edgeStyle: SegmentEdgeStyle.round,
          percentageValues: true,
        ));
  }

  /// End widgets for goal view
  
  
  Widget _currentView(BuildContext context, String _pathBr) {
    return Container(
      width: (widthScreen * 0.9) * 0.5,
      height: heightScreen * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(_pathBr)),
        // color: Colors.tealAccent
      ),
      child: Stack(
        children: <Widget>[
          // _backgroundForViewItem(_pathBr),
          _lableCurrentWeight(),
          _valueOfCurrentWeight(),
        ],
      ),
    );
  }

  /// Widgets of current view
  /// Label
  Widget _lableCurrentWeight() {
    return Container(
      margin: EdgeInsets.only(top: paddingTopGoalAndCurrent, left: paddingLeftGoalAndCurrent, bottom: 0, right: 0),
      child: Column(
        children: <Widget>[
          // current
          Text(
            lblCurrent,
            style: TextStyle(color: Colors.white),
          ),
          // weight
          Text(
            lblWeight,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  /// Value of current weight
  Widget _valueOfCurrentWeight() {
    Color _raminTxtColor = const Color.fromARGB(255, 217, 146, 100);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // number
          Text(
            "83",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: heightScreen * 0.06),
          ),
          // text ramin
          Text(
            "- 1.4kg remain",
            style: TextStyle(
              color: _raminTxtColor,
            ),
          ),
        ],
      ),
    );
  }

  List<ModelItemDiary> _dataDiary = [
    ModelItemDiary.fromJson({
      "day": "Friday",
      "dateAndMonth": "November 3",
      "weightValue": 82.0,
      "indexIc": 1,
      "unit": "kg",
      "descNumber": "0.5"
    }),
    ModelItemDiary.fromJson({
      "day": "Friday",
      "dateAndMonth": "November 3",
      "weightValue": 82.0,
      "indexIc": 0,
      "unit": "kg",
      "descNumber": "0.2"
    }),
    ModelItemDiary.fromJson({
      "day": "Friday",
      "dateAndMonth": "November 3",
      "weightValue": 82.0,
      "indexIc": 1,
      "unit": "kg",
      "descNumber": "0.5"
    }),
  ];

  /// Diary list
  Widget _diaryList(BuildContext context) {
    final double WIDTH_PARENT = widthScreen * 0.9;
    final double HEIGHT_PARENT = heightScreen * 0.3;
    return Container(
      width: WIDTH_PARENT,
      height: HEIGHT_PARENT,
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        itemCount: _dataDiary.length,
        itemBuilder: (BuildContext context, int i) {
          return _itemDiary(_dataDiary[i]);
        },
      ),
    );
  }

  final double txtSizeFirstLine = 22.0;
  final double txtSizeSecondLine = 10.0;

  /// Item diary history
  Widget _itemDiary(ModelItemDiary item) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: heightScreen * 0.06,
          width: widthScreen * 0.9,
          decoration: BoxDecoration(color: colorBrItemDiary),
          child: Row(
            children: <Widget>[
              // Date view
              _dateViewItem(item.day, item.dateAndMonth),
              // Value view
              _valueViewItem(item.weightValue.toString(), item.unit),
              // Icon and factor view
              _iconViewItem(item.indexIc, item.descNumber)
            ],
          ),
        );
      },
    );
  }

  Widget _dateViewItem(String _day, String _dateAndMonth) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(color: colorBrDateViewItem),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Day
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: _textFirstLine(_day),
                )),
            // Month and number day
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(_dateAndMonth,
                      style: TextStyle(fontSize: txtSizeSecondLine, color: colorTxtMain)),
                )),
          ],
        ),
      ),
    );
  }

  Widget _valueViewItem(String _value, String _unit) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: colorBrValueViewItem),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Day
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: _textFirstLine(_value),
                )),
            // Month and number day
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(_unit,
                      style: TextStyle(fontSize: txtSizeSecondLine, color: colorTxtMain)),
                )),
          ],
        ),
      ),
    );
  }

  Widget _iconViewItem(int _path, String _value) {
    String path = "";
    // 1 is up
    // 0 is down
    (_path == 1) ? path = pathIcArrowUp : path = pathIcArrowDown;

    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(color: colorIconViewItem),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Icon arow
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(3),
                        // decoration: BoxDecoration(color: colorBrIcArrow),
                        child: Image.asset(path)),
                  ),
                  // Value factor
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      // decoration: BoxDecoration(
                      //   color: Colors.green,
                      // ),
                      child: _textFirstLine(_value),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFirstLine(String content) {
    return Text(content,
        style: TextStyle(
            fontSize: txtSizeFirstLine,
            color: colorTxtFirstLine,
            fontWeight: fntWeightFirstLine));
  }
}
