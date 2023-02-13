import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/reviews.dart';

import 'package:flutter/material.dart';
import 'package:SnapUp_Project/data/reviews.dart';

class AddReviewPage extends StatefulWidget {
  final int foodId;

  AddReviewPage({this.foodId});

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _reviewTextController = TextEditingController();
  int _rating = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: _reviewTextController,
              decoration: InputDecoration(
                labelText: 'Review',
                hintText: 'Enter your review',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Rating'),
                Row(
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      icon: Icon(
                        index < _rating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              onPressed: () {
                final newReview = Review(
                  //foodId: widget.foodId,
                  userName: _usernameController.text,
                  reviewText: _reviewTextController.text,
                  rating: _rating,
                  reviewDate: DateTime.now(),
                );

                setState(() {
                  existingReviews.add(newReview);
                });

                Navigator.pop(context, newReview);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
