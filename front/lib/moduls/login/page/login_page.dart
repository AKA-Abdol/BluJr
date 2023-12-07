import 'package:flutter/material.dart';
import 'package:khorsand87/constants/string_constants.dart';
import 'package:khorsand87/moduls/login/components/password_text_fiels.dart';
import 'package:khorsand87/moduls/login/page/auth_page.dart';
import 'package:khorsand87/moduls/login/page/sign_up_page.dart';
import 'package:vrouter/vrouter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.welcomeAuth, style: theme.textTheme.headline4),
        const SizedBox(height: 8),
        const TextField(decoration: InputDecoration(label: Text(Strings.username))),
        const SizedBox(height: 16),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {
              context.vRouter.to('/');
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
            child: Text(Strings.login.toUpperCase())),
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
