import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/classes/activity_class.dart';
import 'package:flutter_application_1/views/widgets/hero_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<Activity> _activityFuture;

  @override
  void initState() {
    super.initState();
    _activityFuture = getData();
  }

  Future<Activity> getData() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    var url = Uri.https('corsproxy.io', '', {
      'https://bored-api.appbrewery.com/random?t=$timestamp': '',
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Activity.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load activity');
    }
  }

  void _refreshActivity() {
    setState(() {
      _activityFuture = getData();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshActivity,
          ),
        ],
      ),
      body: FutureBuilder(
        future: _activityFuture,
        builder: (context, AsyncSnapshot<Activity> snapshot) {
          Widget widget;

          if (snapshot.connectionState == ConnectionState.waiting) {
            widget = const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            widget = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    "Error!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${snapshot.error}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            Activity activity = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeroWidget(title: "Course"),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity.activity,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 12),
                            Text('Type: ${activity.type}'),
                            Text('Participants: ${activity.participants}'),
                            Text('Duration: ${activity.duration}'),
                            Text('Price: ${activity.price}'),
                            Text('Availability: ${activity.availability}'),
                            Text('Accessibility: ${activity.accessibility}'),
                            Text(
                              'Kid Friendly: ${activity.kidFriendly ? "Yes" : "No"}',
                            ),
                            if (activity.link.isNotEmpty) ...[
                              const SizedBox(height: 12),
                              InkWell(
                                onTap: () async {
                                  final Uri url = Uri.parse(activity.link);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  activity.link,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            widget = const Center(child: Text("Keine Daten verfügbar"));
          }

          return widget;
        },
      ),
    );
  }
}
