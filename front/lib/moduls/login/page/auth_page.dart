import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khorsand87/constants/string_constants.dart';
import 'package:vrouter/vrouter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final tabTextStyle = TextStyle(color: theme.colorScheme.onPrimary, fontSize: 18, fontWeight: FontWeight.bold);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32, top: 10, left: 16, right: 16),
              child: Image(
                image: AssetImage('assets/images/blue-junior-logo.png'),
                width: 120,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                    color: theme.colorScheme.primary),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = loginTab;
                                });
                              },
                              child: Text(Strings.login.toUpperCase(),
                                  style: tabTextStyle.apply(color: selectedTabIndex == loginTab ? Colors.white : Colors.white54))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = signUpTab;
                                });
                              },
                              child: Text(Strings.signUp.toUpperCase(),
                                  style: tabTextStyle.apply(color: selectedTabIndex == signUpTab ? Colors.white : Colors.white54))),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                            child: selectedTabIndex == loginTab ? _LoginScreen(theme: theme) : _SignUpScreen(theme: theme),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen({
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

class _SignUpScreen extends StatelessWidget {
  const _SignUpScreen({
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
        const TextField(decoration: InputDecoration(label: Text(Strings.fullName))),
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
            child: Text(Strings.signUp.toUpperCase())),
        const SizedBox(width: 8),
      ],
    );
  }
}

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
