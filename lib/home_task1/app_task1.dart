import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonts/home_task1/theme/task1.dart';

class HomeTask1 extends StatelessWidget {
  const HomeTask1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Task1(),
    );
  }
}
