import 'package:flutter/material.dart';
import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:bmicalculator/src/utils/index.dart';

import './HeaderStyle.dart';

class HeaderWidget extends StatelessWidget {
  /// Required parameters
  final String title;
  final String content;
  final String iconFunctionButton;

  final Function behaviorWhenPressButton;
  final Function actionWhenPressBackIcon;

  double widthScreen;
  double heightScreen;

  HeaderWidget(this.title, this.content, this.iconFunctionButton,
      this.behaviorWhenPressButton, this.actionWhenPressBackIcon);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    widthScreen = MediaQuery.of(context).size.width * FACTOR_WIDTH;
    heightScreen = MediaQuery.of(context).size.height * FACTOR_HEIGHT;
    return Center(
      child: Container(
        width: widthScreen,
        height: heightScreen,
        // decoration: BoxDecoration(color: Colors.red),
        margin: EdgeInsets.only(top: statusBarHeight),
        decoration: BoxDecoration(
            // color: Colors.blue
            ),
        child: Row(
          children: <Widget>[
            /// Left
            _leftWidget(context),

            /// Right
            _rightWidget()
          ],
        ),
      ),
    );
  }

  /// Left widget
  /// [RasiedButton] back button
  /// [Text] title - button back label
  /// [Text] content - screen title
  Widget _leftWidget(BuildContext context) {
    return Container(
      width: widthScreen * 0.7,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          // color: Colors.yellow,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Button back and label
          _rowButtonAndLabel(context),
          // Content
          _rowContent()
        ],
      ),
    );
  }

  Widget _rowButtonAndLabel(BuildContext context) {
    return Container(
        width: widthScreen * 0.7,
        height: heightScreen * 0.5,
        decoration: BoxDecoration(
            // color: Colors.purple
            ),
        child: InkWell(
          onTap: actionWhenPressBackIcon,
          child: Row(
            children: <Widget>[
              // Button
              Image.asset(PATH_IC_BACK),
              // Label
              Text(
                title,
                style: TextStyle(color: COLOR_BACK),
              )
            ],
          ),
        ));
  }

  Widget _rowContent() {
    return Container(
      height: heightScreen * 0.5,
      width: widthScreen * 0.7,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          // color: Colors.pink,
          ),
      child: Text(
        content,
        style: TextStyle(
          color: COLOR_WHITE,
          fontSize: SIZE_TXT_CONTENT,
        ),
      ),
    );
  }

  /// Right widget
  /// [RaisedButton] function button
  Widget _rightWidget() {
    return Container(
      height: heightScreen,
      width: widthScreen * 0.3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // color: Colors.blue,
          ),
      // color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(5),
        height: heightScreen * 0.8,
        width: heightScreen * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: behaviorWhenPressButton,
          child: Image.asset(
            iconFunctionButton,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
