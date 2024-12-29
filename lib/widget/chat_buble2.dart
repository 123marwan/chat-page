import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../model/model.dart';

class chatbubles extends StatelessWidget {
  chatbubles({
    super.key,required this.issender, required this.message
  });
  bool issender;
  final Message message;


  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message.message,
      color: Color(0xff006D84),
      tail: true,
      isSender: issender,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,


      ),
    );
  }
}