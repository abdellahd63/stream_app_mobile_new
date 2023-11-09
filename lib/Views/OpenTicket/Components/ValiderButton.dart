import 'package:flutter/material.dart';

class ValiderButton extends StatelessWidget {
  const ValiderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0XFFD4171B),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffd4171b),width: 1.5)
      ),
      
      child: Center(
        child: Text(
          'Valider',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
        ),
      ),
      
    );
  }
}