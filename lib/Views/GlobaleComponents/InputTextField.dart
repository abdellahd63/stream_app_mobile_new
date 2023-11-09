import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController controller; // Specify the type as TextEditingController

  const InputTextField({
    Key? key,
    required this.hint,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffA9A9A9), width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
