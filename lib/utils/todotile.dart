// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, left: 32.0, right: 32.0, bottom: 16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
  children: [
    Checkbox(value: taskStatus, onChanged: onChanged),
    Expanded(
      child: Text(
        taskName,
        overflow: TextOverflow.ellipsis,
        maxLines: null, // Remove maxLines for unlimited lines
        style: TextStyle(
          decoration: taskStatus
              ? TextDecoration.lineThrough
              : TextDecoration.none,
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
