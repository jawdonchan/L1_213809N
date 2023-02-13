import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPhonePage extends StatefulWidget {
  @override
  _CallPhonePageState createState() => _CallPhonePageState();
}

class _CallPhonePageState extends State<CallPhonePage> {
 // String _phoneNumber = "555-555-5555";
  final _formKey = GlobalKey<FormState>();
 // final _phoneController = TextEditingController();
  final _phoneNumberList = ['98609288', '97117655', '97959447'];
  String _selectedPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Call Form Page'),
      ),
     body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              value: _selectedPhoneNumber,
              items: _phoneNumberList
                  .map((phoneNumber) => DropdownMenuItem(
                        child: Text(phoneNumber),
                        value: phoneNumber,
                      ))
                  .toList(),
              onChanged: (phoneNumber) {
                setState(() {
                  _selectedPhoneNumber = phoneNumber as String;
                });
              },
              decoration: InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  launch('tel:$_selectedPhoneNumber');
                }
              },
              child: Text('Call'),
            ),
          ],
        ),
      ),
    );
  }
}