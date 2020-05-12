import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String taskText) {
    _tasks.add(
      Task(name: taskText),
    );
    notifyListeners();
  }

  void addTaskToIndex(Task task, int index) {
    _tasks.insert(index, task);
    notifyListeners();
  }

  void toggleCheck(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  Task deleteTask(int index) {
    var _ = _tasks[index];
    _tasks.removeAt(index);
    notifyListeners();
    return _;
  }
}
