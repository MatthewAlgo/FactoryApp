import 'package:flutter/material.dart';

class Welcome1 extends StatefulWidget {
  const Welcome1({super.key, required this.onWelcomeComplete});

  final VoidCallback onWelcomeComplete;
  @override
  State<Welcome1> createState() => _Welcome1State();
}

class _Welcome1State extends State<Welcome1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}