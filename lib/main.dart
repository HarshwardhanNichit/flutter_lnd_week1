import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/home/domain/task_provider.dart';
import 'features/home/presentation/task_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => TaskProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winjit Task Tracker',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const TaskScreen(),
    );
  }
}
