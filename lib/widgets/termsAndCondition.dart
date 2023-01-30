import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final String label;
  final bool value;
  final Function onChanged;
  const TermsAndConditions(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.green,
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue);
            }),
        SizedBox(
          width: 270,
          child: Text(label,
          style: const TextStyle(
                fontSize: 12,
              ),
          )),
      ],
    );
  }
}
