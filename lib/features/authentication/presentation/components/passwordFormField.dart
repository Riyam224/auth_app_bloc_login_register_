// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PasswordFormatField extends StatelessWidget {
  const PasswordFormatField(
      {super.key,
      required this.controller,
      required this.fKey,
      required this.label,
      required this.obsecure});

  final TextEditingController controller;
  final GlobalKey<FormState> fKey;
  final String label;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: fKey,
        child: TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          validator: (value) => value!.isEmpty ? 'Enter Password' : null,
        ),
      ),
    );
  }
}
