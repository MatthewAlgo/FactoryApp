import 'package:flutter/material.dart';
import 'package:login_screen/screens/welcome_screens/welcome_1.dart';
import 'package:login_screen/screens/welcome_screens/welcome_2.dart';
import 'package:login_screen/screens/welcome_screens/welcome_3.dart';
import 'package:login_screen/screens/welcome_screens/welcome_4.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/welcome1',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/welcome1':
            builder = (BuildContext _) => Welcome1(
                  onWelcomeComplete: () {
                    Navigator.of(context).pop();
                  },
                );
            break;
          case '/welcome2':
            builder = (BuildContext _) => Welcome2(
                  onWelcomeComplete: () {
                    Navigator.of(context).pop();
                  },
                );
            break;
          case '/welcome3':
            builder = (BuildContext _) => Welcome3(
                  onWelcomeComplete: () {
                    Navigator.of(context).pop();
                  },
                );
            break;
          case '/welcome4':
            // Assume ChooseCredentialsPage collects new credentials and then
            // invokes 'onSignupComplete()'.
            builder = (BuildContext _) => Welcome4(
                  onWelcomeComplete: () {
                    Navigator.of(context).pop();
                  },
                );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}