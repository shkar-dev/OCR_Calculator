import 'package:flutter/material.dart';
import 'package:ocr_calculator/Screen/CameraScreen.dart';

import '../color/color.dart';

class BottomNavItem extends StatelessWidget {
  var icon;
  var title;
  String Screen;

  BottomNavItem(this.icon, this.title, this.Screen, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraScreen()),
            );
          },
          minWidth: 30,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              this.icon,
              size: 30,
              color: MyColor.lightgrey,
            ),
            Text(
              this.title,
              style: TextStyle(
                  color: MyColor.lightgrey,
                  fontFamily: "RobotoRegular",
                  fontWeight: FontWeight.w500),
            )
          ]),
        )
      ],
    );
  }
}
