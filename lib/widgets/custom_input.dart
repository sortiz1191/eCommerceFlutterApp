
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {  
  final String hintext;
  const CustomInput({Key key, this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintext,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0
          )
        ),
        style: Constants.regularDarkText,
      )
    );
  }
}