import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
   customtextfield({super.key, this.hinttext,this.onchange,this.obscur=false });
  String? hinttext;
  Function(String)?onchange;
  bool? obscur;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscur!,
      validator:(date) {
        if(date!.isEmpty)
          return 'value is wrong';

      } ,
      onChanged:onchange ,

      decoration: InputDecoration(
        hintText: hinttext,
          hintStyle:TextStyle(
            color: Colors.white
          ) ,
          focusedBorder:
          OutlineInputBorder(

              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          enabledBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          )
      ),
    );
  }
}
