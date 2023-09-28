import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final String text;
  final bool status;
  final ValueChanged<bool?> onChanged;
  final Key? key;

  const CheckBox({
    required this.text,
    required this.status,
    required this.onChanged,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: status,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ],
    );
  }
}
