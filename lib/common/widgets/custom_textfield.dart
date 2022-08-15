import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return '$hintText is required!';
        }
        
        if (hintText.toLowerCase() == "email" && value.contains(' ')) {
          return 'Caracter is invalid!';
        }

        if (hintText.toLowerCase() == "password" &&
            controller.text.length < 8) {
          return '$hintText requires a minimum of 8  characters!';
        }

        return null;
      },
    );
  }
}
