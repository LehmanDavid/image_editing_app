import 'package:flutter/material.dart';
import 'package:image_editing_app/ui/screens/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Editor',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
