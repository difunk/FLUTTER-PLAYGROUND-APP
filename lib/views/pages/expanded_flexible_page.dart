import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Expanded(flex: 4, child: Container(color: Colors.teal)),
            // Expanded(flex: 2, child: Container(color: Colors.orange)),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.teal,
                    height: 20.0,
                    child: Text("data"),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orange,
                    height: 20.0,
                    child: Text("data"),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    color: Colors.orange,
                    height: 20.0,
                    child: Text("data"),
                  ),
                ),
                Expanded(
                  // flex: 4,
                  child: Container(
                    color: Colors.teal,
                    height: 20.0,
                    child: Text("data"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
