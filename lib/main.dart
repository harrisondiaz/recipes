import 'package:flutter/material.dart';
import 'package:recipes/pages/FeedPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipies',
      debugShowCheckedModeBanner: false,

      home: FeedPage(),
    );
  }
}



