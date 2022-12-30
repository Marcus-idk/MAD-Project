import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final void Function() func;
  final double size;
  const NormalButton(this.func, this.size, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.purple,
      child: IconButton(
        icon: Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
          size: size,
        ),
        onPressed: func,
      ),
    );
  }
}
