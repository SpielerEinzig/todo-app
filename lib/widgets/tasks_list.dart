import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final task = taskData.taskView[index];

              return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkBoxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.deleteTask(task);
                },
              );
            });
      },
    );
  }
}
