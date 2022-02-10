import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Complete course"),
    Task(name: "Create projects"),
    Task(name: "Deploy projects"),
    Task(name: "Get a job"),
  ];

  UnmodifiableListView<Task> get taskView {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask({required String taskValue}) {
    _tasks.add(Task(name: taskValue));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
