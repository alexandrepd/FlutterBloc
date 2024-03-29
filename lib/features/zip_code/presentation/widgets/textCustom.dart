import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String label;
  final String content;

  const TextCustom(this.label, this.content);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: '$label ',
                ),
                TextSpan(
                  text: content,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
