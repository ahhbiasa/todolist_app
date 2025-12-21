import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My To-Do List'),
        actions: [
          IconButton(
            icon: Icon(
              vm.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: vm.toggleTheme,
          ),
          PopupMenuButton<TaskFilter>(
            onSelected: vm.setFilter,
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: TaskFilter.all,
                child: Text('All'),
              ),
              PopupMenuItem(
                value: TaskFilter.completed,
                child: Text('Completed'),
              ),
              PopupMenuItem(
                value: TaskFilter.incomplete,
                child: Text('Incomplete'),
              ),
            ],
          ),
        ],
      ),
      body: vm.filteredTasks.isEmpty
          ? const Center(child: Text('No tasks yet'))
          : ListView.builder(
              itemCount: vm.filteredTasks.length,
              itemBuilder: (context, index) {
                final task = vm.filteredTasks[index];

                return Dismissible(
                  key: Key(task.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) => vm.deleteTask(task.id),
                  child: ListTile(
                    title: GestureDetector(
                      onTap: () => _editTask(context, task),
                      child: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    trailing: Checkbox(
                      value: task.isDone,
                      onChanged: (_) => vm.toggleTask(task.id),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Task'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                context.read<TaskViewModel>().addTask(text);
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _editTask(BuildContext context, task) {
    final controller = TextEditingController(text: task.title);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Task'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                context
                    .read<TaskViewModel>()
                    .updateTask(task.id, text);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
