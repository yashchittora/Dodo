import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/todopage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  runApp(const Dodo());
}

class Dodo extends StatelessWidget {
  const Dodo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Dodo",
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
    );
  }
}
