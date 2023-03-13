import 'package:flutter/material.dart';
import 'package:ocr_calculator/Screen/CalculatorScreen.dart';
import 'package:ocr_calculator/Screen/CameraScreen.dart';
import 'package:ocr_calculator/Screen/HomeScreen.dart';

import '../color/color.dart';

class HomeScreenListItem extends StatelessWidget {
  const HomeScreenListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: MyColor.lightgrey)),
        child: ListTile(
          trailing: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          style: ListTileStyle.drawer,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "1,250,000 IQD",
              style: TextStyle(
                color: MyColor.darkGrey,
                fontFamily: "RobotoRegular",
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
