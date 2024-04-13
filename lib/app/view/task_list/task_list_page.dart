import 'package:flutter/material.dart';
import 'package:listaactividades/app/model/task.dart';
import 'package:listaactividades/app/view/components/H1.dart';
import 'package:listaactividades/app/view/components/decoration.dart';

class TaskListPage extends StatelessWidget {
const TaskListPage({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {
  return Scaffold(
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
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
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 35),
          child: H1('Tareas')
          ),
        Expanded(
          child: ListView.separated(
          itemBuilder: (_, index) => Text(taskList[index].title), 
          separatorBuilder: (_,__,) => const SizedBox(height: 16),
          itemCount: taskList.length,)
        ),
      ],
),
floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add, size: 50),
            ),
          );
      }
}

final taskList = [
  Task('hacer la tarea'),
  Task('ver el partido'),
  Task('sacar a el perro'),
  Task("elkin mkon"),
  Task('que cule clase fulera esta pero weno estoy haciendo lo que puedo'),
  Task('breve'),
  Task('breve'),
  Task('breve'),
  Task('breve'),
  Task('breve'),
  Task('breve'),Task('breve'),
];