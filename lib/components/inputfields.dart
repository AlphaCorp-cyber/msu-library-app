// ignore_for_file: must_be_immutable, unnecessary_this

import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  String hint;
  Icon icon;

  InputFields({required this.hint, required this.icon, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: this.icon,
        hintText: this.hint,
      ),
    );
  }
}
