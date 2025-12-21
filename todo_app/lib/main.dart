import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/task_viewmodel.dart';
import 'views/task_list_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel()..loadTasks(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskListView(),
    );
  }
}
