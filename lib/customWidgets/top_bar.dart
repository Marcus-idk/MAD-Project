import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final String title;
  const TopBar(this.title, {Key key}) : super(key: key);

  @override
  _RepeatedCodeState createState() => _RepeatedCodeState();
}

class _RepeatedCodeState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('images/topBG.png'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Container(
                height: 130,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
