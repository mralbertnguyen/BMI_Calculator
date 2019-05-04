import 'package:flutter/material.dart';
import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:bmicalculator/src/utils/theme/index.dart';

class SplashScreen extends BaseScreen {
  double width;
  double height;

  @override
  Widget onInitBody(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          // image personal
          _imageUnder(),
          // Layer top
          _layerGradient(),
          // Top layer
          _layerTop(context)
        ],
      ),
    );
  }

  /// Top layer will contain all content
  Widget _layerTop(BuildContext context) {
    return Positioned(
      bottom: height * PERCENT_BOTTOM_LAYER_TOP,
      child: Container(
        height: height * PERCENT_HEIGHT_LAYER_TOP,
        width: width,
        padding:
            EdgeInsets.only(left: PADDING_LAYER_TOP, right: PADDING_LAYER_TOP),
        decoration: BoxDecoration(
          color: COLOR_BR_LAYER_TOP,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Line 1: Title of
            _lineTitle(),
            _lineContent(),
            _lineBottom()
          ],
        ),
      ),
    );
  }

  ///Line title
  Widget _lineTitle() {
    return Container(
      decoration: new BoxDecoration(),
      margin: EdgeInsets.only(top: MARGIN_TOP_LINE_TITLE),
      child: Text(
        TITLE,
        maxLines: 1,
        style: TextStyle(
          color: COLOR_TITLE,
          fontSize: FONTSIZE_TITLE,
        ),
      ),
    );
  }

  /// Line content
  Widget _lineContent() {
    return Container(
      margin: EdgeInsets.only(bottom: MARGIN_BOTTOM_LINE_CONTENT),
      decoration: new BoxDecoration(),
      child: Text(
        CONTENT,
        maxLines: 2,
        style: TextStyle(
          color: COLOR_CONTENT,
          fontSize: FONTSIZE_CONTENT,
        ),
      ),
    );
  }

  /// Line dot and skip button
  Widget _lineBottom() {
    return Container(
      decoration: new BoxDecoration(
        // color: Colors.red
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // dots
          _dotsGroup(),
          // button skip
          _skipButton(),
        ],
      ),
    );
  }

  /// Container dots
  Widget _dotsGroup() {
    return Container(
      decoration: new BoxDecoration(),
      width: width * 0.1,
      child: Row(),
    );
  }

  /// Skip Button
  Widget _skipButton() {
    return Container(
      width: width * 0.2,
      decoration: new BoxDecoration(
        // color: Colors.pink,
      ),
      child: GestureDetector(
        onTap: () {
          // Tap in skip
          print("Tap on skip");
        },
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[_labelSkip(), _iconSkip()],
        ),
      ),
    );
  }

  /// Label for button skip
  Widget _labelSkip() {
    return new Text(
      SKIP,
      maxLines: 1,
      style: TextStyle(
        color: COLOR_SKIP,
        fontSize: FONTSIZE_TITLE,
      ),
    );
  }

  /// Icon skip
  Widget _iconSkip() {
    return new Container(
      margin: EdgeInsets.only(left: MARGIN_LEFT_IC_SKIP),
      child: Image.asset(PATH_IC_SKIP),
    );
  }

  /// Layer effect on top of picture
  Widget _layerGradient() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PATH_EFFECT_GRADIANT), fit: BoxFit.cover)),
    );
  }

  /// Image personal behind backgroud
  Widget _imageUnder() {
    return Container(
      margin:
          EdgeInsets.only(bottom: (height * PERCENT_MARGIN_BOTTOM_IMG_UNDER)),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PATH_IMG_UNDER), fit: BoxFit.cover)),
    );
  }
}
