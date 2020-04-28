import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {@required this.hintText,
      @required this.onChanged,
      @required this.pass,
      @required this.keyboard});
  final String hintText;
  final Function onChanged;
  final bool pass;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      obscureText: pass,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black87),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
