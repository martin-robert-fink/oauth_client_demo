import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../l10n/generated/l10n.dart';

import '../controllers/task_controller.dart';
import '../widgets/task_card.dart';
import '../auth/user.dart';

class MainPage extends StatelessWidget {
  final tdc = Get.put(TaskController())!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${tdc.taskList.length} '
            '${L10N.current.tasks}')),
        leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: () async =>
                await tdc.addTask().catchError((error) => Get.snackbar(
                      L10N.current.noAddTask,
                      error.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                    ))),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async => await User.logout(),
          ),
        ],
      ),
      body: FutureBuilder(
        future: tdc.getAllTasks(),
        builder: (_, ss) => (ss.connectionState == ConnectionState.waiting)
            ? Center(child: CircularProgressIndicator())
            : Obx(
                () => (tdc.taskList.length == 0)
                    ? Center(
                        child: Text(
                        L10N.current.noTasks,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                    : ListView.builder(
                        itemCount: tdc.taskList.length,
                        itemBuilder: (_, index) =>
                            TaskCard(tdc.taskList[index]),
                      ),
              ),
      ),
    );
  }
}
