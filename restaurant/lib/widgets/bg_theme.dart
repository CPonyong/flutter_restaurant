import 'package:flutter/material.dart';

class ShowBackground extends StatelessWidget {
  final Widget child;

  ShowBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'images/bg_theme.jpeg',
          fit: BoxFit.cover,
        ),
        // image: DecorationImage(
        //   image: AssetImage('images/bg_theme.jpeg'),
        //   fit: BoxFit.cover,
        // ),
        child,
      ],
    );
  }
}
