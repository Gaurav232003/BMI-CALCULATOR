import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icontext, required this.iconicon});
  final String icontext;
  final Icon iconicon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconicon,
        SizedBox(
          height: 15,
        ),
        Text(
          icontext,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
