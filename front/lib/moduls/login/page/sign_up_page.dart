import 'package:flutter/material.dart';
import 'package:khorsand87/constants/string_constants.dart';
import 'package:khorsand87/moduls/login/components/password_text_fiels.dart';
import 'package:vrouter/vrouter.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({
    Key? key,
    required this.theme,
    required this.fullnameController,
    required this.onSaveFullName,
    required this.apiCall, // Added callback function
  }) : super(key: key);

  TextEditingController fullnameController = TextEditingController();
  final ThemeData theme;
  final void Function(String fullName) onSaveFullName; // Callback function
  final void Function() apiCall;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.welcomeAuth, style: widget.theme.textTheme.headline4),
        const SizedBox(height: 8),
        TextField(
          controller: widget.fullnameController,
          decoration: InputDecoration(
            label: Text(Strings.fullName),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text(Strings.username),
          ),
        ),
        const SizedBox(height: 16),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {
            print(widget.fullnameController.text);

            // Call the callback function to save the full name
            widget.onSaveFullName(widget.fullnameController.text);

            // Add a delay of 5 seconds before calling widget.apiCall()
            Future.delayed(Duration(seconds: 2), () {
              widget.apiCall();

              // Navigate or perform other actions as needed
              context.vRouter.to('/');
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 60)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          ),
          child: Text(Strings.signUp.toUpperCase()),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
