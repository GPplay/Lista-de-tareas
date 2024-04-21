import 'package:flutter/foundation.dart';
import 'package:listaactividades/app/model/task.dart';
import 'package:listaactividades/app/repository/task_repository.dart';
class TaskProvider extends ChangeNotifier {
  List<Task> _taskList =[];
  final TaskRepository _taskRepository = TaskRepository();

  Future<void> fetchTasks() async {
    _taskList = await _taskRepository.getTasks();
    notifyListeners();
  }
  List<Task> get taskList => _taskList;

  set taskList(List<Task> value) {
    _taskList = value;
    notifyListeners();
  }

  void onTaskDoneChange(Task task) {
    task.done = !task.done;
    _taskRepository.saveTasks(_taskList);
    notifyListeners();
  }

  void addNewTask(Task task) {
    _taskRepository.addTask(task);
    fetchTasks();
  }
  
}