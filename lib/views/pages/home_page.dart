import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/container_widget.dart';
import 'package:flutter_application_1/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: "Home"),
            ...List.generate(2, (index) {
              return ContainerWidget(
                title: "Title",
                description: "Description",
              );
            }),
            Column(
              children: List.generate(2, (index) {
                return ContainerWidget(
                  title: "Title",
                  description: "Description",
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
