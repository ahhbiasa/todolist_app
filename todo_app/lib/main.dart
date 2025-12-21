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
    final vm = context.watch<TaskViewModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: vm.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const TaskListView(),
    );
  }
}
