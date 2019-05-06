import 'package:flutter/material.dart';
import 'package:bmicalculator/src/base/ui/BaseScreen.dart';
import 'package:bmicalculator/src/utils/index.dart';
import 'package:bmicalculator/src/utils/widgets/index.dart';

class CalculatorScreen extends BaseScreen{
  Size size;

  @override
  Widget onInitAppBar(BuildContext context){
    return null;
  }

  @override
  Widget onInitBody(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          /// Header
          HeaderWidget(size, "Weight Diary", "BMI Calculator", "./diary", PATH_IC_REFRESH, (){
            print("Press button function");
          })
        ],
      ),
    );
  }


}