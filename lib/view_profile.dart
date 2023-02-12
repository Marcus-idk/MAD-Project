import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key key}) : super(key: key);

  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  String name = '';
  String email = '';
  String number = '';
  void initState() {
    super.initState();
    helper();
  }

  Future<void> helper() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      number = prefs.getString('number');
    });
  }

  Widget displayName(String s) {
    List<String> splitBySpace = s.split(" ");
    List<TextSpan> listOfWidgets = new List<TextSpan>();
    for (int i = 0; i < splitBySpace.length; i++) {
      if (i == 0) {
        listOfWidgets.add(TextSpan(
          text: splitBySpace[i] + "\n",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
      } else {
        listOfWidgets.add(TextSpan(
          text: splitBySpace[i] + "\n",
        ));
      }
    }
    return Container(
      width: 120,
      child: RichText(
        softWrap: true,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
          children: listOfWidgets,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TopBar('View Profile'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 70, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 10, 20, 20),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFA500).withOpacity(0.3),
                              ),
                            ),
                          ),
                          displayName(name),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 1, color: Colors.purple),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Joined\n',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                TextSpan(
                                  text: '2 ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'mon ago',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFA500).withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              email,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Email',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              number,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Phone',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              '0',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Orders',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Container(
                    width: 220,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/editProfile'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.purple.withOpacity(0.3),
                                radius: 35,
                                child: Icon(
                                  Icons.settings,
                                  size: 50,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/orderHistory'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.purple.withOpacity(0.3),
                                radius: 35,
                                child: Icon(
                                  Icons.history,
                                  size: 45,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                                child: Text(
                                  'Order History',
                                  style: TextStyle(fontSize: 20),
                                ),
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
          ),
        ),
      ],
    );
  }
}
