import 'package:flutter/material.dart';
import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:bmicalculator/src/utils/index.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';

//Models
import 'package:bmicalculator/src/models/ModelItemList.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(PATH_BR), fit: BoxFit.cover)),
        child: CalculatorStateful(),
      ),
    );
  }
}

class CalculatorStateful extends StatefulWidget {
  CalculatorStateful({Key key}) : super(key: key);

  @override
  CalculatorScreenState createState() => new CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorStateful> {
  Size size;

  /// Data for list
  List<ModelItemList> itemList = new List<ModelItemList>();

  /// Set default is Male

  @override
  void initState() {
    // Init default value for list
    itemList.add(
        ModelItemList.fromJson({"label": "cm", "desc": "ft", "value": 170.0}));
    itemList.add(
        ModelItemList.fromJson({"label": "kg", "desc": "lb", "value": 75.0}));
    itemList.add(
        ModelItemList.fromJson({"label": "goal", "desc": "", "value": 79.0}));
    itemList.add(
        ModelItemList.fromJson({"label": "age", "desc": "", "value": 21.0}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

  pushScreen(BuildContext context, String screenName) async {
    return await Navigator.pushNamed(context, screenName);
  }

  void _pressButtonFunction() {
    print("Press button function");
  }

  bool isMale = true;
  bool isFeMale = false;

  double maleO = 1;
  double femaleO = 0.2;

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
          IgnorePointer(
              ignoring: isMale,
              child: _itemFormInActive(context, Alignment.centerLeft, 0, 10,
                  PATH_IC_MALE, "MALE", maleO, true)),

          /// Rigth - Female
          IgnorePointer(
              ignoring: isFeMale,
              child: _itemFormInActive(context, Alignment.centerLeft, 10, 0,
                  PATH_IC_FEMALE, "FEMALE", femaleO, false))
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

  Widget _itemFormInActive(
      BuildContext context,
      Alignment aligment,
      double marginLeft,
      double marginRight,
      String path,
      String text,
      double opacity,
      bool isMan) {
    double WIDTH_ITEM = MediaQuery.of(context).size.height * 0.2;
    double HEIGHT_ITEM = MediaQuery.of(context).size.height * 0.2;
    final Color mainColor = Color.fromARGB(100, 114, 144, 157);
    double MARGIN_ITEM = 10.0;
    return InkWell(
      onTap: () {
        _setGender(isMan);
      },
      child: Opacity(
        opacity: opacity,
        child: new Container(
          height: HEIGHT_ITEM,
          width: WIDTH_ITEM,
          decoration: new BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(20)),
          child: new Row(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: Container(
                  margin: new EdgeInsets.only(
                    top: MARGIN_ITEM,
                    bottom: MARGIN_ITEM,
                  ),
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

  /// Function handle choose gender
  _setGender(bool _isMan) {
    if (!_isMan) {
      setState(() {
        isMale = false;
        isFeMale = true;
        maleO = 0.2;
        femaleO = 1;
      });
    } else {
      setState(() {
        isMale = true;
        isFeMale = false;
        maleO = 1;
        femaleO = 0.2;
      });
    }
    print("Male is ${isMale}");
    print("Female is ${isFeMale}");
  }

  /// List view item's infomations

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
              context, itemList[index], HEIGHT_LIST, WIDGHT_LIST, index);
        },
      ),
    );
  }

  Widget _itemListInfo(BuildContext context, ModelItemList data, double _height,
      double _width, int index) {
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
                    child: _numberData(data.value.toString()),
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
                          _buttonItemsList(index, 0, PATH_IC_MINUS),
                          // + button
                          _buttonItemsList(index, 1, PATH_IC_PLUS)
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

  /// Button have two type
  /// minus button and plus button
  /// @required three parameters are:
  /// - kind of button minues (0) or plus (1)
  /// - index of button (int)
  /// - bath of img for button

  Widget _buttonItemsList(int index, int kind, String pathBr) {
    return InkWell(
      onTap: () {
        String will = "";
        (kind == 0) ? _minusData(index) : _plusData(index);
        print("Value ${itemList[index].value} will be ${will}");
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
  _minusData(int index) {
    setState(() {
      itemList[index].value -= 1;
    });
  }

  _plusData(int index) {
    setState(() {
      itemList[index].value += 1;
    });
  }

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
