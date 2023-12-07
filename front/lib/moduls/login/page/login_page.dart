import 'package:flutter/material.dart';
import 'package:khorsand87/constants/string_constants.dart';
import 'package:khorsand87/moduls/login/components/password_text_fiels.dart';
import 'package:khorsand87/moduls/login/page/auth_page.dart';
import 'package:khorsand87/moduls/login/page/sign_up_page.dart';
import 'package:vrouter/vrouter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
    required this.theme,
    required this.fullnameController,
    required this.onSaveFullName,
    required this.apiCall,
  }) : super(key: key);

  TextEditingController fullnameController = TextEditingController();
  final ThemeData theme;
  final void Function(String fullName) onSaveFullName; // Callback function
  final void Function() apiCall;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.welcomeAuth, style: widget.theme.textTheme.headline4),
        const SizedBox(height: 8),
        TextField(
          controller: widget.fullnameController,
          decoration: const InputDecoration(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(Strings.forgetPassword),
            const SizedBox(width: 8),
            TextButton(onPressed: () {}, child: const Text(Strings.refactorPassword))
          ],
        ),
      ],
    );
  }
}
