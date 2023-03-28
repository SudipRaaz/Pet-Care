import 'package:pet_care/Controller/authentication_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_care/view/dashboard_page.dart';

import '../page_layout.dart';
import 'login_page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    // creating a stream for auth changes to listen
    // return LoginScreen();
    return StreamBuilder(
      stream: Authentication().authStateChange,
      builder: (context, snapshot) {
        // if snapshot from stream has data loading dashboard page
        if (snapshot.hasData) {
          return const PageLayout();
        } else {
          // if snapshot from stream has does not have any data loading login page
          return const LoginScreen();
        }
      },
    );
  }
}
