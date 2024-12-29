import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatapp/const/const.dart';
import 'package:chatapp/model/model.dart';
import 'package:flutter/material.dart';

class chatbuble extends StatelessWidget {
   chatbuble({
    super.key,this.issender, required this.message
  });
  bool? issender;
  final Message message;


  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message.message,
      color: Kprimarycolor,
      tail: true,
      isSender: issender!,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,


      ),
    );
  }
}
