import 'package:flutter/material.dart';
import 'package:project/customWidgets/normal_button.dart';
import 'customWidgets/top_bar.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBar('About Us'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset("images/aboutUsBG1.png"),
                    Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 1000,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Who are we?',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  'In 2021, following the success of Super apps like Gojek, Grab, etc, a sea of entrepreneurs emerged in distinct corners of the world to replicate the success of Grab.',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Image.asset("images/aboutUsBG2.png"),
                    Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 1000,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Who are we?',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  'In 2021, following the success of Super apps like Gojek, Grab, etc, a sea of entrepreneurs emerged in distinct corners of the world to replicate the success of Grab.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/aboutUsPerson1.png'),
                              radius: 50,
                            ),
                            Text(
                              'Person 1',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/aboutUsPerson2.png'),
                              radius: 50,
                            ),
                            Text(
                              'Person 2',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/aboutUsPerson3.png'),
                              radius: 50,
                            ),
                            Text(
                              'Person 3',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Contact us!', style: TextStyle(fontSize: 30)),
                NormalButton(
                    () => Navigator.pushNamed(context, '/contactUs'), 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
