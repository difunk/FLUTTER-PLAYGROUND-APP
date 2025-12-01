import 'package:flutter/material.dart';

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
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!), centerTitle: true),
      body: currenIndex == 0
          ? Center(child: Text("1"))
          : Center(child: Text("2")),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon((Icons.home)), label: "home"),
          NavigationDestination(icon: Icon((Icons.person)), label: "profile"),
        ],
        onDestinationSelected: (int value) {
          setState(() {
            currenIndex = value;
          });
        },
        selectedIndex: currenIndex,
      ),
    );
  }
}
