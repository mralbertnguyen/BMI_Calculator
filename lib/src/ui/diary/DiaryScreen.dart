import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class DiaryScreen extends BaseScreen {
  double widthScreen = 0.0;
  double heightScreen = 0.0;

  double PADDING_PARENT_SCREEN = 30;

  final List<Widget> _contentList = [];
  final Color colorTxtGoalAndValue = Color.fromARGB(40, 54, 65, 100);
  final Color colorTxtKg = Color.fromARGB(114, 144, 157, 100);
  final String PATH_IC_PLUS = "lib/src/assets/images/btn_add.png";
  final String pathArrowUp = "lib/src/assets/icons/ic_arrow_up.png";
  final String pathArrowDown = "lib/src/assets/icons/ic_arrow_down.png";

  @override
  Widget onInitBody(BuildContext context) {
    // init item into list widgets

    // Get width height
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: <Widget>[
          HeaderWidget(
              "Calculator", "Weight Diary", "./calculator", PATH_IC_PLUS, () {
            print("Press button function");
          }),
          _contentBody(context)
        ],
      ),
    );
  }

  Widget _contentBody(BuildContext context) {
    final double WIDTH_PARENT = widthScreen * 0.9;
    final double HEIGHT_PARENT = heightScreen * 0.8;

    return Container(
      alignment: Alignment.topCenter,
      height: HEIGHT_PARENT,
      width: WIDTH_PARENT,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(color: Colors.red),
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
      width: widthScreen * 0.9,
      height: heightScreen * 0.1,
      decoration: BoxDecoration(color: Colors.red),
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
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          // Title
          Container(
            height: (heightScreen * 0.1) * 0.5,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.purple),
            child: Text("Title"),
          ),
          // Content
          Container(
            height: (heightScreen * 0.1) * 0.5,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Content"),
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
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.red),
            child: Row(
              children: <Widget>[
                // Month
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.pink),
                    child: Center(
                      child: Text("month"),
                    ),
                  ),
                ),
                // Year
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Center(
                      child: Text("year"),
                    ),
                  ),
                ),
                // All
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Text("all"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Line - empty
          Container(
            height: (heightScreen * 0.1) * 0.5,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.yellow),
          )
        ],
      ),
    );
  }

  /// Chart
  Widget _chart(BuildContext context) {
    return Container(
      width: widthScreen * 0.9,
      height: heightScreen * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.pink),
    );
  }

  ///
  /// Description
  Widget _noteDesc(BuildContext context) {
    return Container(
        width: widthScreen * 0.9,
        height: heightScreen * 0.15,
        decoration: BoxDecoration(color: Colors.purple));
  }

  ///
  /// Goal and current weight
  Widget _goalsAndCurrent(BuildContext context) {
    final String PATH_BR_GOAL = "lib/src/assets/images/br_goal.png";
    final String PATH_BR_CURRENT = "lib/src/assets/images/br_current.png";
    final double WIDTH_PARENT = widthScreen * 0.9;
    final double HEIGHT_PARENT = heightScreen * 0.2;
    return Container(
      decoration: BoxDecoration(color: Colors.yellow),
      width: WIDTH_PARENT,
      height: HEIGHT_PARENT,
      child: Row(
        children: <Widget>[
          // Left
          _goalView(context, PATH_BR_GOAL),
          // Right
          _currentView(context, PATH_BR_CURRENT)
        ],
      ),
    );
  }

  Widget _goalView(BuildContext context, String _pathBr) {
    return Container(
      width: (widthScreen * 0.9) * 0.5,
      height: heightScreen * 0.2,
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
          margin: EdgeInsets.only(top: 10, left: 20, bottom: 0, right: 0),
          child: Text("GOAL", style: TextStyle(color: colorTxtGoalAndValue)),
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
              style: TextStyle(color: colorTxtGoalAndValue, fontSize: 40)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: Text("kg", style: TextStyle(color: colorTxtKg)),
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
  ///
  ///
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
      alignment: Alignment(0.3, 0.2),
      child: Column(
        children: <Widget>[
          // current
          Text(
            "Current",
            style: TextStyle(color: Colors.white),
          ),
          // weight
          Text(
            "Weight",
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
      "descNumber": "32"
    }),
    ModelItemDiary.fromJson({
      "day": "Friday",
      "dateAndMonth": "November 3",
      "weightValue": 82.0,
      "indexIc": 0,
      "unit": "kg",
      "descNumber": "32"
    }),
    ModelItemDiary.fromJson({
      "day": "Friday",
      "dateAndMonth": "November 3",
      "weightValue": 82.0,
      "indexIc": 1,
      "unit": "kg",
      "descNumber": "32"
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
          decoration: BoxDecoration(color: Colors.pink),
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
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: Colors.yellow),
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
                  alignment: Alignment.centerLeft,
                  child: Text(_dateAndMonth,
                      style: TextStyle(fontSize: txtSizeSecondLine)),
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
        decoration: BoxDecoration(color: Colors.pink),
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
                  alignment: Alignment.centerRight,
                  child: Text(_unit,
                      style: TextStyle(fontSize: txtSizeSecondLine)),
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
    (_path == 1) ? path = pathArrowUp : path = pathArrowDown;

    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
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
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(color: Colors.purple),
                        child: Image.asset(path)),
                  ),
                  // Value factor
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
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
        style: TextStyle(fontSize: txtSizeFirstLine, color: Colors.white, fontWeight: FontWeight.w400));
  }
}

class ModelItemDiary {
  String day;
  String dateAndMonth;
  double weightValue;
  String unit;
  int indexIc;
  String descNumber;

  ModelItemDiary(
      {this.day,
      this.dateAndMonth,
      this.weightValue,
      this.unit,
      this.indexIc,
      this.descNumber});

  factory ModelItemDiary.fromJson(Map<String, dynamic> json) {
    return ModelItemDiary(
      day: json['day'],
      dateAndMonth: json['dateAndMonth'],
      weightValue: json['weightValue'],
      unit: json['unit'],
      indexIc: json['indexIc'],
      descNumber: json['descNumber'],
    );
  }
}
