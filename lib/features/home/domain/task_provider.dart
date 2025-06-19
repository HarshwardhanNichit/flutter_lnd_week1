import 'package:flutter/material.dart';
import 'task_model.dart';
import '../data/task_local_data_source.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get activeTasks =>
      _tasks.where((task) => !task.isCompleted).toList();
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  List<Task> get allTasks => _tasks;

  final TaskLocalDataSource _dataSource = TaskLocalDataSource();

  TaskProvider() {
    loadFromStorage();
  }

  Future<void> loadFromStorage() async {
    _tasks = await _dataSource.loadTasks();
    notifyListeners();
  }

  Future<void> _saveToStorage() async {
    await _dataSource.saveTasks(_tasks);
  }

  void addTask(String title) {
    _tasks.add(Task(title: title));
    _saveToStorage();
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    _saveToStorage();
    notifyListeners();
  }

  void clearCompleted() {
    _tasks.removeWhere((t) => t.isCompleted);
    _saveToStorage();
    notifyListeners();
  }
}
