import 'package:flutter/material.dart';
import 'package:listaactividades/app/model/task.dart';
import 'package:listaactividades/app/view/components/H1.dart';
import 'package:listaactividades/app/view/components/decoration.dart';
import 'package:listaactividades/app/view/task_list/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';


class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (_)=> TaskProvider()..fetchTasks(),
      child: Scaffold(
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            Expanded(
                child:_TaskList()
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _showNewTaskModal(context),
              child: const Icon(Icons.add, size: 50),
            )
        ),
      ),
    );
  }

void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => ChangeNotifierProvider.value(
          value: context.read<TaskProvider>(),
          child: _NewTaskModal(),
        )
      );
  }
}

class _NewTaskModal extends StatelessWidget {
  // ignore: unused_element
  _NewTaskModal({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nueva tarea'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
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
                  const H1('Nueva tarea'),
                  const SizedBox(height: 26),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Descripción de la tarea',
                    ),
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        final task = Task(_controller.text);
                        context.read<TaskProvider>().addNewTask(task);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Guardar'),
                  )
                ],
              ),
            ),
          ),
        );
      },
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done ? Icons.check_box : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 10,
              ),
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

class _TaskList extends StatelessWidget {
  // ignore: unused_element
  const _TaskList({ super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const H1('Tareas'),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (_, provider, __){
                if(provider.taskList.isEmpty){
                  return const Center(child: Text('No hay tareas'),) ;
                }
                return ListView.separated(
                itemCount: provider.taskList.length,
                separatorBuilder: (_,__) => const SizedBox(height: 16,),
                itemBuilder: (_, index) => _TaskItem(
                  provider.taskList[index],
                  ontap: () => provider.onTaskDoneChange(provider.taskList[index]),
                )
                );
              },
              )
          ),
        ],
      ),
    );
  }
}
