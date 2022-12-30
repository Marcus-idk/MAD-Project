import 'package:flutter/material.dart';

import 'normal_button.dart';

class MultiSelect extends StatefulWidget {
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  const MultiSelect(this.name1, this.name2, this.name3, this.name4, {Key key})
      : super(key: key);

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;
  bool pressAttention4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: new Text(widget.name1),
              textColor: Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              color: pressAttention1 ? Colors.purple : Colors.white,
              onPressed: () =>
                  setState(() => pressAttention1 = !pressAttention1),
            ),
            RaisedButton(
              child: new Text(widget.name2),
              textColor: Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              color: pressAttention2 ? Colors.purple : Colors.white,
              onPressed: () =>
                  setState(() => pressAttention2 = !pressAttention2),
            ),
            RaisedButton(
              child: new Text(widget.name3),
              textColor: Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              color: pressAttention3 ? Colors.purple : Colors.white,
              onPressed: () =>
                  setState(() => pressAttention3 = !pressAttention3),
            ),
            RaisedButton(
              child: new Text(widget.name4),
              textColor: Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              color: pressAttention4 ? Colors.purple : Colors.white,
              onPressed: () =>
                  setState(() => pressAttention4 = !pressAttention4),
            ),
          ],
        ),
      ),
    );
  }
}
