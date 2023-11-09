import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final text;
  const CancelButton({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffd4171b),width: 1.5)
      ),
      
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Color(0xffd4171b),fontWeight: FontWeight.bold,fontSize: 17),
        ),
      ),
      
    );
  }
}