import 'package:flutter/material.dart';

class QuantityPickerDialog extends StatefulWidget {
  final void Function(int quantity) onQuantitySelected;

  QuantityPickerDialog({this.onQuantitySelected});

  @override
  _QuantityPickerDialogState createState() => _QuantityPickerDialogState();
}

class _QuantityPickerDialogState extends State<QuantityPickerDialog> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Quantity"),
      content: Container(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
            ),
            Text("$_quantity"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() => _quantity++),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            widget.onQuantitySelected(_quantity);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
