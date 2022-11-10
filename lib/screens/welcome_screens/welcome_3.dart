import 'package:flutter/material.dart';

class Welcome3 extends StatefulWidget {
  const Welcome3({super.key,required this.onWelcomeComplete});

  final VoidCallback onWelcomeComplete;
  @override
  State<Welcome3> createState() => _Welcome3State();
}

class _Welcome3State extends State<Welcome3> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}