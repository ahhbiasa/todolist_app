import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/local_storage.dart';
import 'package:uuid/uuid.dart';

class TaskViewModel extends ChangeNotifier {
  final LocalStorageService _storage = LocalStorageService();
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    final loadedTasks = await _storage.loadTasks();
    _tasks
      ..clear()
      ..addAll(loadedTasks);
    notifyListeners();
  }

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

  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isDone = !_tasks[index].isDone;
      await _storage.saveTasks(_tasks);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }

  /// ✅ EDIT TASK
  Future<void> updateTask(String id, String newTitle) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].title = newTitle;
      await _storage.saveTasks(_tasks);
      notifyListeners();
    }
  }
}
