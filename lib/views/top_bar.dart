import 'package:factoryapp/login/screens/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import google fonts
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget getAppBarForApp(BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromARGB(221, 113, 142, 237),
    toolbarHeight: 100,
    elevation: 14,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(70), bottomLeft: Radius.circular(70))),
    title: Text(
      'FactoryApp',
    ),
    
    actions: [
      Row(
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 3,
                      color: Color.fromARGB(255, 56, 46, 186))
                ],
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 107, 68, 246)),
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              // Show a box with the user's profile from the database
            },
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Color.fromARGB(255, 56, 46, 186))
                  ],
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 107, 68, 246)),
              child: Icon(
                Icons.person,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              // Show a logout dialog
              showCustomDialog(context);
            },
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Color.fromARGB(255, 56, 46, 186))
                  ],
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 107, 68, 246)),
              child: Icon(
                Icons.logout,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 26,
          )
        ],
      )
    ],
  );
}

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 240,
          child: SizedBox.expand(
            child: // Create a Container with text and two buttons
                Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Scaffold(
                body: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Are you sure you want to logout?',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Log out the user from firebase
                              // and navigate to the login screen
                              signOut(context);
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        spreadRadius: 3,
                                        color: Color.fromARGB(255, 56, 46, 186))
                                  ],
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 107, 68, 246)),
                              child: Text(
                                'Yes',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Close the dialog
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        spreadRadius: 3,
                                        color: Color.fromARGB(255, 56, 46, 186))
                                  ],
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 107, 68, 246)),
                              child: Text(
                                'No',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

signOut(BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
  // Push the welcome screen without the ability to go back
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false);
}
