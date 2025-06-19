import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../domain/task_model.dart';
import '../../../core/utils/task_converter.dart';

class TaskLocalDataSource {
  static const _key = 'tasks';

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = tasks
        .map((task) => jsonEncode(TaskConverter.toJson(task)))
        .toList();
    await prefs.setStringList(_key, jsonList);
  }

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList
        .map((jsonStr) => TaskConverter.fromJson(jsonDecode(jsonStr)))
        .toList();
  }
}
