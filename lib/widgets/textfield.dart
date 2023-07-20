import 'package:flutter/material.dart';

class TextFieldwithTitle extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  const TextFieldwithTitle(
      {super.key, required this.title, required this.hint,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 8),
          child: Text(title,style: const TextStyle(fontSize: 17),)),
        TextField(
          style: const TextStyle(fontSize: 18),
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            hintText: hint,
          ),
        )
      ],
    );
  }
}
