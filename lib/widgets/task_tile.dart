import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallbackState;
  final Function longPressTaskAction;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallbackState,
      this.longPressTaskAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
        onLongPress: longPressTaskAction,
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.deepPurpleAccent,
          value: isChecked,
          onChanged: checkBoxCallbackState,
        ),
      ),
    );
  }
}
