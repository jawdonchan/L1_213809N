import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class FeedbackPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
             TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
              ),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: 'Message',
              ),
               maxLines: 5,
            ),
            RaisedButton(
              onPressed: () => _sendEmail(),
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  _sendEmail() async {
    final String emailadd = _emailController.text;
    final String subject = _subjectController.text;
    final String body = _bodyController.text;
    final String email = 'mailto:$emailadd?subject=$subject&body=$body';
    if (await canLaunch(email)) {
      
      await launch(email);
    } else {
      throw 'Could not send email';
    }
  }
}
