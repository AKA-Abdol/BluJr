import 'package:flutter/material.dart';
import 'package:khorsand87/constants/string_constants.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscareText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscareText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text(Strings.password),
        suffixIcon: TextButton(
          style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            setState(() {
              obscareText = !obscareText;
            });
          },
          child: Text(obscareText ? 'show' : 'hide'),
        ),
      ),
    );
  }
}
