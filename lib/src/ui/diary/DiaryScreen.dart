import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';

class DiaryScreen extends BaseScreen {
  double widthScreen = 0.0;
  double heightScreen = 0.0;

  double PADDING_PARENT_SCREEN = 30;

  List<Widget> widgets = [];

  @override
  Widget onInitBody(BuildContext context) {
    // init item into list widgets

    String PATH_IC_PLUS = "lib/src/assets/images/btn_add.png";
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

          // Calendar
          _calendar(context),

          // Chart view
          _chart(context),

          // View note for chart
          _noteDesc(context),

          // Show Goals and Current
          _goalsAndCurrent(context)
        ],
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
        decoration: BoxDecoration(color: Colors.pink));
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
          //Right
          _currentView(context, PATH_BR_CURRENT)
        ],
      ),
    );
  }

  Widget _goalView(BuildContext context, String _pathBr) {
    final Color colorTxtGoalAndValue = Color.fromARGB(40, 54, 65, 100);
    final Color colorTxtKg = Color.fromARGB(114, 144, 157, 100);
    return Container(
      width: (widthScreen * 0.9) * 0.5,
      height: heightScreen * 0.2,
      decoration: BoxDecoration(
        // color: Colors.white
          image: DecorationImage(image: AssetImage(_pathBr))
          ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Stack(
        children: <Widget>[
          // goal text
          Container(
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text("GOAL", style: TextStyle(color: colorTxtGoalAndValue)),
          ),
          // Circle
          // Value
          Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("79",style: TextStyle(color: colorTxtGoalAndValue)),
          ),
          // kg
          Container(
              decoration: BoxDecoration(color: Colors.pink), child: Text("kg",style: TextStyle(color: colorTxtKg)))
        ],
      ),
    );
  }

  Widget _currentView(BuildContext context, String _pathBr) {
    return Container(
      width: (widthScreen * 0.9) * 0.5,
      height: heightScreen * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_pathBr)
        ),
        color: Colors.tealAccent
        ),
      child: Stack(

      ),
    );
  }

  /// Diary list
}
