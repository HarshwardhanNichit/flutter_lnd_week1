import 'dart:convert';
import '../../../features/home/domain/task_model.dart';

class TaskConverter {
  static String toJson(Task task) =>
      json.encode({'title': task.title, 'isCompleted': task.isCompleted});
  static Task fromJson(String jsonStr) {
    final map = json.decode(jsonStr);
    return Task(title: map['title'], isCompleted: map['isCompleted']);
  }
}
