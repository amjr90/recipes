import 'package:flutter/material.dart';
import 'src/features/recipes_feed/presentation/pages/recipes_feed_pg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipesFeedPage(),
    );
  }
}
