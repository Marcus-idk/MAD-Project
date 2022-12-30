import 'package:flutter/material.dart';

import 'normal_button.dart';

class FoodDisplay extends StatelessWidget {
  final String img;
  final String price;
  final String name;
  const FoodDisplay(this.img, this.price, this.name, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Image(
            width: 300,
            height: 120,
            image: AssetImage("images/" + img),
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: FittedBox(
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              child: Text(
                                price,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                  child: NormalButton(
                      () => Navigator.of(context).pushReplacementNamed('/'),
                      30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
