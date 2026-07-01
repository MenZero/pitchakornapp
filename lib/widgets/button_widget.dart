// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ButtonWiget extends StatelessWidget {
  const ButtonWiget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function() onPressed;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return GFButton(onPressed: onPressed, text: text,);
  }
}
