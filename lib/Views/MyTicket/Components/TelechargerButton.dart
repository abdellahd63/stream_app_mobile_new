import 'package:flutter/material.dart';

class TelechargerButton extends StatelessWidget {
  const TelechargerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 56, 187, 0),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color.fromARGB(255, 56, 187, 0),width: 1.5)
      ),
      
      child: Center(
        child: Text(
          'Telecharger Mon Ticket',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
        ),
      ),
      
    );
  }
}