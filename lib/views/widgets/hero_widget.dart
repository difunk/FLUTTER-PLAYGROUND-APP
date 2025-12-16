import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: "hero1",
          child: ClipRRect(
            child: Image.asset(
              "assets/images/bg.jpg",
              color: Colors.teal,
              colorBlendMode: BlendMode.darken,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 50.0,
              letterSpacing: 5.0,
              color: Colors.white30,
            ),
          ),
        ),
      ],
    );
  }
}
