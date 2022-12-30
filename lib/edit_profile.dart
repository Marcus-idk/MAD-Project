import 'package:flutter/material.dart';
import 'package:project/customWidgets/bottom_navbar.dart';
import 'package:project/customWidgets/top_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      bottomNavigationBar: BottomNavbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar('Edit Profile'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 70, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter Name',
                                hintText: 'Enter Your Name'),
                          ),
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
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter Email',
                          hintText: 'Enter Email'),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter Phone Number',
                          hintText: 'Enter Phone Number'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.purple.withOpacity(0.3),
                          radius: 35,
                          child: Icon(
                            Icons.arrow_back,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text(
                            'Go Back',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
