import 'package:flutter/material.dart';
import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:bmicalculator/src/utils/index.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';

class CalculatorScreen extends BaseScreen {
  Size size;

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /// Header
          HeaderWidget(size, "Weight Diary", "BMI Calculator", "./diary",
              PATH_IC_REFRESH, () {
            print("Press button function");
          }),

          /// Form choose male or female
          _formSetMaleOrFemal(context),

          /// Button
          _buttonCalculator(context)
        ],
      ),
    );
  }

  /// Form set Male or Female
  Widget _formSetMaleOrFemal(BuildContext context) {
    double HEIGHT_FORM = MediaQuery.of(context).size.height * 0.2;
    double WIDTH_FORM = MediaQuery.of(context).size.width * 0.9;
    double PADDING_FORM = 10.0;
    String PATH_IC_MALE = "lib/src/assets/icons/ic_male.png";
    String PATH_IC_FEMALE = "lib/src/assets/icons/ic_female.png";
    return Container(
      height: HEIGHT_FORM,
      width: WIDTH_FORM,
      padding: EdgeInsets.only(top: PADDING_FORM),
      decoration: BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// Left - Male
          _itemFormInActive(
              context, Alignment.centerLeft, 0, 10, PATH_IC_MALE, "MALE"),

          /// Rigth - Female
          _itemFormInActive(
              context, Alignment.centerLeft, 10, 0, PATH_IC_FEMALE, "FEMALE")
        ],
      ),
    );
  }

  /// Item form set Male and Female
  /// [BuildContext] context
  /// [Alignment] aligment
  /// [double] margin left
  /// [double] margin right
  /// [String] path icon
  /// [String] text
  Widget _itemFormInActive(BuildContext context, Alignment aligment,
      double marginLeft, double marginRight, String path, String text) {
    double WIDTH_ITEM = MediaQuery.of(context).size.height * 0.2;
    double HEIGHT_ITEM = MediaQuery.of(context).size.height * 0.2;
    double MARGIN_ITEM = 10.0;
    return new Container(
      height: HEIGHT_ITEM,
      width: WIDTH_ITEM,
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
      child: new Row(
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: Container(
              margin: new EdgeInsets.only(
                  top: MARGIN_ITEM,
                  bottom: MARGIN_ITEM,
                  left: marginLeft,
                  right: marginRight),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0)),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /// Icon
                    new Container(
                        height: HEIGHT_ITEM * 0.3,
                        width: HEIGHT_ITEM * 0.3,
                        decoration: BoxDecoration(color: Colors.pink)),

                    /// Text
                    new Container(
                      margin: EdgeInsets.only(top: 10),
                      child: new Text(
                        text,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///
  /// List basic infomations of user
  ///
  ///
  /// Button calculator
  ///
  Widget _buttonCalculator(BuildContext context) {
    double heightViewButton = MediaQuery.of(context).size.height * 0.12;
    double widthViewButton = MediaQuery.of(context).size.width * 0.9;
    return GestureDetector(
      onTap:(){
        print("Press button");
      },
      child: Container(
        height: heightViewButton,
        width: widthViewButton,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top:  10),
        decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/src/assets/images/br_btn.png"),
            ),
            borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: new Text(
                "Calculate your BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                )),
            ),
      ),
    );
  }
}
