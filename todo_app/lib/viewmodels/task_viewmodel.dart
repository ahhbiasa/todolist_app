import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/local_storage.dart';
import 'package:uuid/uuid.dart';

class TaskViewModel extends ChangeNotifier {
  final LocalStorageService _storage = LocalStorageService();
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  /// Load tasks from local storage
  Future<void> loadTasks() async {
    final loadedTasks = await _storage.loadTasks();
    _tasks.clear();
    _tasks.addAll(loadedTasks);
    notifyListeners();
  }

  /// Add new task (simple version)
  Future<void> addTask(String title) async {
    final newTask = Task(
      id: const Uuid().v4(),
      title: title,
      description: '',
      isDone: false,
    );


    _tasks.add(newTask);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }

  /// Toggle task done / not done
  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isDone = !_tasks[index].isDone;
      await _storage.saveTasks(_tasks);
      notifyListeners();
    }
  }

  /// Delete task (for later)
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }
}