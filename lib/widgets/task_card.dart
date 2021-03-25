import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../l10n/generated/l10n.dart';

import '../controllers/task_controller.dart';
import '../model/task.dart';

class TaskCard extends StatelessWidget {
  final tdc = Get.find<TaskController>();
  TaskCard(this.task);
  final Task task;

  final cardPadding = 5.0;
  final columnPadding = 10.0;
  final containerMargin = const EdgeInsets.all(10.0);
  final containerPadding = const EdgeInsets.only(right: 8.0);
  final taskTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final taskDetailTextStyle = const TextStyle(fontSize: 12);
  final dateTextStyle = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final DateFormat df = DateFormat.yMMMd();
    return Dismissible(
      key: GlobalKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => tdc.deleteTask(task),
      background: Container(
        color: Colors.red,
        margin: containerMargin,
        padding: containerPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Icon(Icons.delete, color: Colors.white)],
        ),
      ),
      child: Card(
        elevation: 5,
        color: Colors.teal[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.description,
              style: taskTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              task.detail,
              style: taskDetailTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.teal,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      L10N.current.startDate,
                      style: dateTextStyle,
                    ),
                    (task.startDate == null)
                        ? SizedBox()
                        : Text(df.format(task.startDate!)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      L10N.current.dueDate,
                      style: dateTextStyle,
                    ),
                    (task.dueDate == null)
                        ? SizedBox(width: 85)
                        : Text(df.format(task.dueDate!)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      L10N.current.priority,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(task.priority.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      L10N.current.complete,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(task.complete.toString() + L10N.current.percent),
                  ],
                ),
              ],
            ),
          ],
        ).paddingAll(columnPadding),
      ).paddingAll(cardPadding),
    );
  }
}
