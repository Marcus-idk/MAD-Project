import 'package:flutter/material.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'customWidgets/order_history_food.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TopBar('Order History'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  OrderHistoryFood(
                    'salmon.jpg',
                    'Being Made',
                    'Today, 13:15',
                  ),
                  OrderHistoryFood(
                    'salmon.jpg',
                    'Delivered',
                    '22/12/2021 18:16',
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
