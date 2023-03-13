import 'package:flutter/material.dart';

import '../color/color.dart';

class Button extends StatelessWidget {
  late var icon;

  Button(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColor.yellow, width: 2),
      ),
      width: 100,
      height: 100,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColor.darkGrey),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Icon(
          this.icon,
          color: MyColor.yellow,
          size: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
