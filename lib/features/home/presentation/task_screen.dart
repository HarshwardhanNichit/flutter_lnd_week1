import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/task_provider.dart';
import 'task_details.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final activeTasks = taskProvider.activeTasks;
    final completedTasks = taskProvider.completedTasks;

    final TextEditingController taskController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0eafc), Color(0xFFcfdef3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // AppBar replacement
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Winjit Task Tracker',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                // Input Field
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.indigo.shade100,
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          controller: taskController,
                          decoration: const InputDecoration(
                            hintText: 'Enter task title',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {
                        if (taskController.text.trim().isNotEmpty) {
                          taskProvider.addTask(taskController.text.trim());
                          taskController.clear();
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Active Tasks
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Active Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: activeTasks.isEmpty
                      ? const Center(
                          child: Text(
                            "No active tasks.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: activeTasks.length,
                          itemBuilder: (context, index) {
                            final task = activeTasks[index];
                            // Find the index of this task in the original _tasks list
                            final originalIndex = taskProvider.allTasks.indexOf(
                              task,
                            );
                            return Card(
                              color: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: BorderSide(
                                  color: Colors.indigo.shade100,
                                  width: 1.2,
                                ),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TaskDetails(task: task),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  activeColor: Colors.indigo,
                                  title: Text(
                                    task.title,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  value: task.isCompleted,
                                  onChanged: (val) {
                                    taskProvider.toggleTaskStatus(
                                      originalIndex,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),

                const SizedBox(height: 10),

                // Completed Tasks Header
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Completed Tasks',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),

                // Completed Tasks List
                Expanded(
                  child: completedTasks.isEmpty
                      ? const Center(
                          child: Text(
                            "No completed tasks.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: completedTasks.length,
                          itemBuilder: (context, index) {
                            final task = completedTasks[index];
                            final originalIndex = taskProvider.allTasks.indexOf(
                              task,
                            );
                            return Card(
                              color: Colors.indigo[50],
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: BorderSide(
                                  color: Colors.indigo.shade100,
                                  width: 1.2,
                                ),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TaskDetails(task: task),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  activeColor: Colors.indigo,
                                  title: Text(
                                    task.title,
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  value: task.isCompleted,
                                  onChanged: (val) {
                                    taskProvider.toggleTaskStatus(
                                      originalIndex,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),

                // Clear History Button at the bottom center
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton.icon(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      label: const Text(
                        'Clear History',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: completedTasks.isEmpty
                          ? null
                          : () => taskProvider.clearCompleted(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
