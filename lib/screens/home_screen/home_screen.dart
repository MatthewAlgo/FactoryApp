import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_screen/screens/home_screen/top_bar.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a fully featured scaffold
    return Scaffold(
      // Create a appbar
      appBar: getAppBarForApp(context),
      // Create a body
      body: Center(
        // Page view with 3 pages
        child: PageView(
          children: [
            // First page
            Center(
              child: Text('Page 1'),
            ),
            // Second page
            Center(
              child: Text('Page 2'),
            ),
            // Third page
            Center(
              child: Text('Page 3'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavigationBar(
        barWidth: // Set the width of the bar
            MediaQuery.of(context).size.width,
        backgroundColor: Color.fromARGB(221, 113, 142, 237),
        iconColor: Colors.white,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
        iconSize: 15.0,
        items: [
          NavBarItems(icon: EvaIcons.homeOutline, title: "Home"),
          NavBarItems(icon: EvaIcons.shoppingCartOutline, title: "Cart"),
          NavBarItems(icon: EvaIcons.activity, title: "Profile"),
        ],
        onChanged: (value) {
          // USE YOUR STATE MANAGEMENT TECHNIQUE TO GET
          // AND CHANGE INDEX OF NAVIGATION BAR
        },
      ),
    );
  }
}
