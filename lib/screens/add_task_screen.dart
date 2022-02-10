import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                newTaskTitle = value;
              },
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusColor: Colors.lightBlueAccent,
                hoverColor: Colors.lightBlueAccent,
                fillColor: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                //add new task
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskValue: newTaskTitle);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              style:
                  TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
