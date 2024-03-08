import 'package:flutter/material.dart';
import '../model/task.dart';

class TaskItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final deleteTask;
  // ignore: prefer_typing_uninitialized_variables
  final completeTask;
  // ignore: prefer_typing_uninitialized_variables
  final editTask;
  final Task task;

  const TaskItem({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.completeTask,
    required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 60,
      margin: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black12,
          ),
          color: Colors.indigo[50],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: ListTile(
          contentPadding: const EdgeInsets.only(left: 15),
          visualDensity: const VisualDensity(horizontal: -3),
          onTap: () {
            completeTask(task);
          },
          leading: Icon(
            task.check
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: Colors.indigo[300],
          ),
          title: Text(
            task.desc!,
            style: TextStyle(
                decoration: task.check
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               IconButton(
                onPressed: () {
                  editTask(task);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                onPressed: () {
                  deleteTask(task.id);
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          )),
    );
  }
}
