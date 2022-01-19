// @dart=2.7

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterapp_cozy/theme.dart';

class BottomnavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  BottomnavbarItem({
    this.imageUrl,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
