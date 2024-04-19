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
              onPressed:() => _showNewTaskModal(context),
              child: const Icon(Icons.add, size: 50),
            ),
          );
      }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (_) => _NewTaskModal(onTaskCreated: (Task task) { 
        print(task.title);
       },)
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  // ignore: unused_element
  _NewTaskModal({super.key, required this.onTaskCreated});

  final _controller = TextEditingController();
  final void Function(Task task) onTaskCreated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33,vertical: 23),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(21),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        const H1('nueva tarea'),
        const SizedBox(height: 26,),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: 'descripcion de la tarea',
          ),
        ),
        const SizedBox(height: 26,),
        ElevatedButton(onPressed: (){
          if(_controller.text.isNotEmpty){
            // ignore: unused_local_variable
            final task = Task(_controller.text);
            onTaskCreated(task);
            Navigator.of(context).pop();
          }
        }, child: const Text('Guardar'), )
      ]),
    );
  }
}

class _TaskItem extends StatelessWidget {
  // ignore: unused_element
  const _TaskItem(this.task, {super.key, this.ontap});

  final Task task;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21)
        ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done ? Icons.check_box : Icons.check_box_outline_blank , 
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10,),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  // ignore: unused_element
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
  // ignore: unused_element
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
              itemBuilder: (_, index) => _TaskItem(taskList[index], ontap: () {
                taskList[index].done = !taskList[index].done;
                setState(() {});
              },), 
              separatorBuilder: (_,__,) => const SizedBox(height: 16),
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }
}
