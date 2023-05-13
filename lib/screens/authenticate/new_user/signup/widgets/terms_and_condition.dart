import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final bool value;
  final Function onChanged;
  const TermsAndConditions(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
            activeColor: Colors.green,
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue);
            }),
        const Expanded(
          child: Text.rich(
            TextSpan(
                text: 'I agree to the ',
                style: TextStyle(fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Terms and Condition ',
                      style: TextStyle(
                          color: Color.fromARGB(190, 237, 112, 23),
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          fontSize: 12)),
                  TextSpan(
                      text: 'of services and ', style: TextStyle(fontSize: 12)),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(190, 237, 112, 23),
                      ))
                ]),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
