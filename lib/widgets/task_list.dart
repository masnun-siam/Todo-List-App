import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_data.dart';
import 'package:todolist/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkBoxCallbackState: (checkboxStatus) {
                taskData.toggleCheck(index);
              },
              longPressTaskAction: () {
                final tempTask = taskData.deleteTask(index);
                Scaffold.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text("Task Deleted"),
                  action: SnackBarAction(
                    onPressed: () {
                      taskData.addTaskToIndex(tempTask, index);
                    },
                    label: 'Undo',
                  ),
                ));
              }, // LongPressAction
            );
          }, // ItemBuilder
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
