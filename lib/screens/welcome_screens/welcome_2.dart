import 'package:flutter/material.dart';

class Welcome2 extends StatefulWidget {
  const Welcome2({super.key,required this.onWelcomeComplete});

  final VoidCallback onWelcomeComplete;
  @override
  State<Welcome2> createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}