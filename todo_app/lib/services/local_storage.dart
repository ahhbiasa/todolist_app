import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class LocalStorageService {
  static const _taskKey = 'tasks';
  static const _themeKey = 'isDarkMode';

  /// Save tasks
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList(_taskKey, jsonList);
  }

  /// Load tasks
  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_taskKey) ?? [];
    return jsonList
        .map((json) => Task.fromJson(jsonDecode(json)))
        .toList();
  }

  /// Save theme mode
  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  /// Load theme mode
  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }
}
