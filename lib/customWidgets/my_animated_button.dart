import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class MyAnimatedButton extends StatelessWidget {
  final void Function() func;
  final String text;
  final int width;
  const MyAnimatedButton(this.width, this.text, this.func, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: width.toDouble(),
      height: 60,
      text: text,
      isReverse: true,
      selectedTextColor: Colors.white,
      transitionType: TransitionType.CENTER_LR_IN,
      selectedBackgroundColor: Colors.blue[600],
      textStyle: TextStyle(color: Colors.black, fontSize: 18),
      onPress: () {
        Future.delayed(Duration(milliseconds: 300), () {
          func();
        });
      },
    );
  }
}
