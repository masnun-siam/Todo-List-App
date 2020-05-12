import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_data.dart';
import 'package:todolist/widgets/add_task.dart';
import 'package:todolist/widgets/task_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskBar(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 40.0,
              top: 80.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //The List icon
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.deepPurpleAccent,
                    size: 25.0,
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                //The app title
                Text(
                  'Todo List',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                //Number of tasks
                Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return Text(
                      (taskData.taskCount > 1)
                          ? '${taskData.taskCount.toString()} Tasks'
                          : '${taskData.taskCount.toString()} Task',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30.0,
          ),

          //List
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
