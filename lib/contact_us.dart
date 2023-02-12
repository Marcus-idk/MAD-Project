import 'package:flutter/material.dart';
import 'customWidgets/top_bar.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUsScreen> {
  String _subject;
  String _body;
  String phoneNumber = "tel:" + "82900055";
  Future<void> submitForm() async {
    final Email send_email = Email(
      body: _body + " from: marcusgohkz@gmail.com",
      subject: _subject,
      recipients: ['marcusgohkz@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );
    await FlutterEmailSender.send(send_email);
  }

  final _formKey = GlobalKey<FormState>();

  String validate(String s) {
    if (s.isEmpty) {
      return "This field cannot be empty!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar('About Us'),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Email Header',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                      child: TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          setState(() {
                            _subject = value;
                          });
                        },
                        validator: validate,
                        decoration: InputDecoration(
                          labelText: 'Subject',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Email Message',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                      child: TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          setState(() {
                            _body = value;
                          });
                        },
                        validator: validate,
                        decoration: InputDecoration(
                          labelText: 'Body',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              submitForm();
                            }
                          },
                          child: const Text('Submit feedback',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Text('Call us', style: TextStyle(fontSize: 30)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () async {
                            await launch(phoneNumber);
                          },
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
    );
  }
}
