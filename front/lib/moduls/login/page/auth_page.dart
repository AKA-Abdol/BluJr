import 'package:flutter/material.dart';
import 'package:khorsand87/constants/string_constants.dart';
import 'package:khorsand87/moduls/core/api/storage.dart';
import 'package:khorsand87/moduls/login/api/get_profile_api.dart';
import 'package:khorsand87/moduls/login/model/profile_model.dart';
import 'package:khorsand87/moduls/login/page/login_page.dart';
import 'package:khorsand87/moduls/login/page/sign_up_page.dart';
import 'package:vrouter/vrouter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final GetProfileApi _getProfileApi = GetProfileApiImp();
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;
  String _fullName = ''; // Add this line to store the full name

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
                    color: theme.colorScheme.primary,
                  ),
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
                              child: Text(
                                Strings.login.toUpperCase(),
                                style: tabTextStyle.apply(color: selectedTabIndex == loginTab ? Colors.white : Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = signUpTab;
                                });
                              },
                              child: Text(
                                Strings.signUp.toUpperCase(),
                                style: tabTextStyle.apply(color: selectedTabIndex == signUpTab ? Colors.white : Colors.white54),
                              ),
                            ),
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
                              child: selectedTabIndex == loginTab
                                  ? LoginScreen(
                                      theme: theme,
                                    )
                                  : SignUpScreen(
                                      fullnameController: _fullNameController,
                                      theme: theme,
                                      onSaveFullName: saveFullNameInAccessToken,
                                      apiCall: getProfileAndUpdateUI,
                                    ),
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
        ),
      ),
    );
  }

  Future<void> saveFullNameInAccessToken(String fullName) async {
    // Assuming you have a method to save the access token with the full name
    // Replace this with your actual implementation
    // For example, if you have a Storage class with a setAccessToken method:
    Storage.instance.setAccessToken(fullName);
  }

  Future<void> getProfileAndUpdateUI() async {
    try {
      // Fetch the updated profile with the new access token
      final ProfileModel profile = await _getProfileApi.getProfile();

      // Update the UI with the fetched profile data
      setState(() {
        // Assuming you have a state variable to store the full name
        _fullName = profile.firstName + ' ' + profile.lastName;
      });
    } catch (e) {
      // Handle errors and exceptions
      print('Failed to fetch profile: $e');
    }
  }
}
