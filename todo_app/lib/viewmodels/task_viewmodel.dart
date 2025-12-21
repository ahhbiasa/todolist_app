import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/task.dart';
import '../services/local_storage.dart';

/// Filter options
enum TaskFilter { all, completed, incomplete }

class TaskViewModel extends ChangeNotifier {
  final LocalStorageService _storage = LocalStorageService();
  final List<Task> _tasks = [];

  TaskFilter _filter = TaskFilter.all;

  /// Get all tasks (raw)
  List<Task> get tasks => _tasks;

  /// Get filtered tasks
  List<Task> get filteredTasks {
    switch (_filter) {
      case TaskFilter.completed:
        return _tasks.where((t) => t.isDone).toList();
      case TaskFilter.incomplete:
        return _tasks.where((t) => !t.isDone).toList();
      case TaskFilter.all:
      default:
        return _tasks;
    }
  }

  /// Change filter
  void setFilter(TaskFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  /// Load from storage
  Future<void> loadTasks() async {
    final loadedTasks = await _storage.loadTasks();
    _tasks
      ..clear()
      ..addAll(loadedTasks);
    notifyListeners();
  }

  /// Add task
  Future<void> addTask(String title) async {
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      description: '',
      isDone: false,
    );

    _tasks.add(task);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }

  /// Edit task
  Future<void> updateTask(String id, String newTitle) async {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index].title = newTitle;
      await _storage.saveTasks(_tasks);
      notifyListeners();
    }
  }

  /// Toggle done
  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index].isDone = !_tasks[index].isDone;
      await _storage.saveTasks(_tasks);
      notifyListeners();
    }
  }

  /// Delete task
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((t) => t.id == id);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }
}
