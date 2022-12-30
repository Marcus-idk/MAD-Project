import 'package:flutter/material.dart';

import 'normal_button.dart';

class OrderHistoryFood extends StatelessWidget {
  final String img;
  final String status;
  final String orderTime;
  const OrderHistoryFood(this.img, this.status, this.orderTime, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Image(
              width: 350,
              height: 150,
              image: AssetImage("images/" + img),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 1,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'STATUS',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'PLACED',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          status,
                          style: TextStyle(color: Colors.purple),
                        ),
                        Text(
                          orderTime,
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
