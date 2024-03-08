import 'package:flutter/material.dart';
import 'package:primeiro/model/task.dart';
import 'package:primeiro/widgets/task_item.dart';

class PageTodo extends StatefulWidget {
  const PageTodo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<PageTodo> {
  int idTask = 0;
  bool edit = false;
  Task? taskToEdit;
  final tasks = Task.toDoList();
  final _inputController = TextEditingController();
  FocusNode inputFocus = FocusNode();

  void _createTask(String inputValue) {
    if (inputValue != '') {
      setState(() {
        tasks.add(Task(id: idTask, desc: inputValue));
        idTask++;
        _inputController.clear();
      });
    }
  }

  void _deleteTask(int id) {
    setState(() {
      tasks.removeWhere((item) => item.id == id);
    });
  }

  void _completeTask(Task task) {
    setState(() {
      task.check = !task.check;
    });
  }

  void _handleEdit(Task task) {
    setState(() {
      edit = true;
      inputFocus.requestFocus();
      _inputController.text = task.desc!;
      taskToEdit = task;
    });
  }

  void _editTask(Task task, String input) {
    setState(() {
      if (edit && _inputController.text.isNotEmpty) {
        task.desc = input;
        _inputController.text = '';
        edit = false;
      } else {
        edit = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        height: 600,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const Text(
                'Todo List',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              width: 250,
              child: TextField(
                controller: _inputController,
                focusNode: inputFocus,
                maxLength: 20,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 350,
              height: 350,
              child: Scaffold(
                  body: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.indigo.shade200),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: ListView(
                  children: [
                    for (Task task in tasks)
                      TaskItem(
                        task: task,
                        deleteTask: _deleteTask,
                        completeTask: _completeTask,
                        editTask: _handleEdit,
                      )
                  ],
                ),
              )),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: edit
                      ? () => _editTask(taskToEdit!, _inputController.text)
                      : () => _createTask(_inputController.text),
                  child: Text(edit ? 'Editar' : 'Criar tarefa'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
