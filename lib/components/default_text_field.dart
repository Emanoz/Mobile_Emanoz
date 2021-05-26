import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final Function onTap;
  final TextInputType keyboardType;
  final bool obscureText;

  DefaultTextField(
      {@required this.labelText,
      @required this.hintText,
      this.controller,
      this.maxLength = 40,
      this.maxLines = 1,
      this.onTap,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextFormField(
        obscureText: obscureText,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
              width: 1.0,
            ),
          ),
        ),
        controller: controller,
        onTap: onTap,
        keyboardType: keyboardType,
      ),
    );
  }
}
