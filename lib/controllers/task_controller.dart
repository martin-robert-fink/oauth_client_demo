import 'package:get/get.dart';

import '../l10n/generated/l10n.dart';

import '../model/task.dart';
import '../database/tasks.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;

  Future<void> addTask() async {
    var nextTask = await count() + 1;
    final fakeTask = Task(
      description: L10N.current.task(nextTask),
      detail: L10N.current.taskDetail(nextTask),
      startDate: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 7)),
      complete: 0,
      priority: 1,
    );
    try {
      await TasksDb.add(fakeTask);
      taskList.add(fakeTask);
    } catch (error) {
      print('error was in addTask');
      Get.snackbar(
        L10N.current.errorGettingTaskData,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getAllTasks() async {
    try {
      taskList.clear();
      taskList.addAll(await TasksDb.getAll());
    } catch (error) {
      print('error was in getAllTasks: ${error.toString()}');
      Get.snackbar(
        L10N.current.errorGettingTaskData,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<int> count() async {
    try {
      return await TasksDb.count();
    } catch (error) {
      Get.snackbar(
        L10N.current.errorGettingTaskData,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return 0;
  }

  Future<void> deleteTask(Task task) async {
    try {
      await TasksDb.delete(task);
      taskList.remove(task);
    } catch (error) {
      Get.snackbar(
        L10N.current.errorGettingTaskData,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
