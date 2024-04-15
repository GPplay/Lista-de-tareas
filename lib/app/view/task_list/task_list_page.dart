import 'package:flutter/material.dart';
import 'package:listaactividades/app/model/task.dart';
import 'package:listaactividades/app/view/components/H1.dart';
import 'package:listaactividades/app/view/components/decoration.dart';

class TaskListPage extends StatelessWidget {
const TaskListPage({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {
  return Scaffold(
  body: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          _Header(),
          Expanded(child: _TaskList()),
      ],
),
floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add, size: 50),
            ),
          );
      }
}

class _TaskItem extends StatelessWidget {
  // ignore: unused_element
  const _TaskItem(this.task, {super.key});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21)
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
        child: Row(
          children: [
            Icon(Icons.check_box_outline_blank, 
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 10,),
            Text(task.title),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
          const Row(children: [Decoracion()]),
    Column(
          children: [
                      Image.asset(
                      'assets/image/tasks-list-image.png',
                      width: 120,
                      height: 120,
                      ),
                      const SizedBox(height: 16),
                      const H1('Completa tus tareas', color: Colors.white),
                  ],
                )
              ],
            ),
        );
  }
}

class _TaskList extends StatefulWidget {
  const _TaskList({super.key});
  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {

  final taskList = <Task> [
    Task('hacer la tarea'),
    Task('ver el partido'),
    Task('sacar a el perro'),
    Task('breve'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const H1('Tareas'),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => _TaskItem(taskList[index]), 
              separatorBuilder: (_,__,) => const SizedBox(height: 16),
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }
}
