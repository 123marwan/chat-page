import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
   custombutton({super.key,required this.tile ,this.ontab});
  String tile;
  VoidCallback?ontab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
            color: Colors.white),
      
        child: Center(
          child: Text(
              tile
          ),
        ),
      ),
    );
  }
}
