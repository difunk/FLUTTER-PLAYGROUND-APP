import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widget_tree.dart';
import 'package:flutter_application_1/widgets/navbar_widget.dart';

void main() {
  runApp(const MyApp());
}

String? title = "Flutter";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: WidgetTree(),
    );
  }
}
