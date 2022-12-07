import 'package:factoryapp/providers/options_list_provider.dart';
import 'package:factoryapp/views/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// Import the curved navigation bar
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// Import providers
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          // Set the controller
          controller: context.read<BottomViewListProvider>().pageController,
          onPageChanged: (value) =>
              context.read<BottomViewListProvider>().updateIndex(value),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 149, 188, 255),
        index: context.watch<BottomViewListProvider>().selectedIndex,
        // Set the background color
        color: Colors.blue,
        items: <Widget>[
          Icon(EvaIcons.homeOutline, size: 30),
          Icon(EvaIcons.shoppingCartOutline, size: 30),
          Icon(EvaIcons.activity, size: 30),
        ],
        onTap: (index) {
          // Handle the change
          context.read<BottomViewListProvider>().updateIndex(index);
        },
      ),
    );
  }
}
