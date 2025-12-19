import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/constants.dart';
import 'package:flutter_application_1/views/widgets/container_widget.dart';
import 'package:flutter_application_1/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<(String, String)> list = [
      (KValue.keyConcepts, 'Description for key concepts'),
      (KValue.cleanUi, 'Description for clean UI'),
      (KValue.fixBug, 'Description for fix bug'),
      (KValue.basicLayout, 'Description for basic layout'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: "Home"),
            ...List.generate(4, (index) {
              return ContainerWidget(
                title: list[index].$1,
                description: list[index].$2,
              );
            }),
          ],
        ),
      ),
    );
  }
}
