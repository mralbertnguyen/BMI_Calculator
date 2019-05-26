import 'package:flutter/material.dart';
import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:bmicalculator/src/utils/index.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';

//Models
import 'package:bmicalculator/src/models/ModelItemList.dart';

class CalculatorScreen extends BaseScreen {
  Size size;

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /// Header
          HeaderWidget("Weight Diary", "BMI Calculator", PATH_IC_REFRESH,
              this._pressButtonFunction, () {
            _pushToDiaryScreen(context);
          }),

          /// Form choose male or female
          _formSetMaleOrFemal(context),

          /// List content info
          _listInfo(context),

          /// Button
          _buttonCalculator(context)
        ],
      ),
    );
  }

  /// Function push to Diary screen
  _pushToDiaryScreen(BuildContext context) {
    print("Press back function");
    final String _screenName = './diary';
    pushScreen(context, _screenName);
  }

  void _pressButtonFunction() {
    print("Press button function");
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
      decoration: BoxDecoration(
          // color: Colors.red
          ),
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
    return InkWell(
      onTap: () {
        //Pressed choose item
        print("Choose sex");
      },
      child: Opacity(
        opacity: 0.9,
        child: new Container(
          height: HEIGHT_ITEM,
          width: WIDTH_ITEM,
          decoration: new BoxDecoration(
              // color: Colors.black,
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
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /// Icon
                        new Container(
                          height: HEIGHT_ITEM * 0.3,
                          width: HEIGHT_ITEM * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.pink
                              ),
                          child: new Image.asset(
                            path,
                            color: Colors.white,
                          ),
                        ),

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
        ),
      ),
    );
  }

  /// List view item's infomations
  /// Data for list
  List<ModelItemList> itemList = [
    ModelItemList.fromJson({"label": "cm", "desc": "ft", "value": "170"}),
    ModelItemList.fromJson({"label": "kg", "desc": "lb", "value": "75.0"}),
    ModelItemList.fromJson({"label": "goal", "desc": "", "value": "79"}),
    ModelItemList.fromJson({"label": "age", "desc": "", "value": "21"})
  ];

  ///
  /// List basic infomations of user
  Widget _listInfo(BuildContext context) {
    double HEIGHT_LIST = MediaQuery.of(context).size.height * 0.5;
    double WIDGHT_LIST = MediaQuery.of(context).size.width * 0.9;
    return new Container(
      height: HEIGHT_LIST,
      width: WIDGHT_LIST,
      decoration: new BoxDecoration(
          // color: Colors.purpleAccent
          ),
      child: ListView.builder(
        itemCount: itemList.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (BuildContext context, int index) {
          return _itemListInfo(
              context, itemList[index], HEIGHT_LIST, WIDGHT_LIST);
        },
      ),
    );
  }

  Widget _itemListInfo(
      BuildContext context, ModelItemList data, double _height, double _width) {
    final Color colorsBrItemRight = Color.fromARGB(47, 63, 75, 100);
    final String PATH_IC_MINUS = "lib/src/assets/images/btn_minus.png";
    final String PATH_IC_PLUS = "lib/src/assets/images/btn_plus.png";
    final COLOR_TXT_DESC = const Color.fromARGB(114, 144, 157, 100);

    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        height: _height * 0.23,
        width: _width,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: <Widget>[
            /// Left
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: Colors.blueGrey
                        ),
                    child: Text(
                      data.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: Colors.lightBlue
                        ),
                    child: Text(
                      data.descLabel,
                      style: TextStyle(
                        color: COLOR_TXT_DESC,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Right
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  /// Layer 1 - View show number data
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: colorsBrItemRight,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: _numberData(data.value),
                  ),

                  /// Layer 2 - (+ -) buttons
                  Container(
                      alignment: Alignment(1, 0),
                      margin: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // - button
                          _buttonItemsList(_minusData, PATH_IC_MINUS),
                          // + button
                          _buttonItemsList(_plusData, PATH_IC_PLUS)
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonItemsList(Function _function, String pathBr) {
    return InkWell(
      onTap: () {
        _function();
      },
      child: Container(
        width: 26,
        height: 26,
        child: Image.asset(pathBr),
      ),
    );
  }

  Widget _numberData(String _number) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // color: Colors.black
          ),
      child: new Text(_number,
          style: TextStyle(color: Colors.white, fontSize: 40)),
    );
  }

  /// Functions for handle actions when pressed button - / +
  _minusData() {
    print("Press minus data function");
  }

  _plusData() {
    print("Press plus data function");
  }

  // Widget _itemListInfoLeft(BuildContext context, ModelItemList data) {
  //   double WIDTH_ITEM = MediaQuery.of(context).size.height * 0.2;
  //   double HEIGHT_ITEM = MediaQuery.of(context).size.height * 0.2;
  //   return new Container(
  //     height: HEIGHT_ITEM,
  //     width:HEIGHT_ITEM ,
  //     decoration: BoxDecoration(color: Colors.red),
  //     child: new Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         // Title
  //         new Text(
  //           data.label
  //         ),
  //         // Desc
  //         new Text(
  //           data.descLabel
  //         ),
  //       ],
  //     ),
  //   );
  // }

  ///
  /// Button calculator
  ///
  Widget _buttonCalculator(BuildContext context) {
    double heightViewButton = MediaQuery.of(context).size.height * 0.07;
    double widthViewButton = MediaQuery.of(context).size.width * 0.9;
    return InkWell(
      onTap: () {
        print("Press button");
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: widthViewButton,
        height: heightViewButton,
        decoration: new BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(31)),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Image(
              width: widthViewButton,
              height: heightViewButton,
              fit: BoxFit.fill,
              image: AssetImage("lib/src/assets/images/br_btn.png"),
            ),
            //  Background
            new Center(
              child: new Text(
                "Calculate your BMI",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
