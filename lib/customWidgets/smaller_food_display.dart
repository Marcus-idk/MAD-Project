import 'package:flutter/material.dart';
import 'package:project/menu_individual.dart';

import 'normal_button.dart';

class SmallerFoodDisplay extends StatelessWidget {
  final String img;
  final String price;
  final String name;
  final int index;
  const SmallerFoodDisplay(this.img, this.price, this.name, this.index,
      {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 0),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Image(
              width: 180,
              height: 120,
              image: AssetImage("images/" + img),
              fit: BoxFit.cover,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: FittedBox(
                            child: FloatingActionButton(
                              heroTag: null,
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
                          border: Border.all(color: Colors.purple, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: NormalButton(
                      () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MenuIndividualScreen(data: index),
                              ),
                            ),
                          },
                      30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
