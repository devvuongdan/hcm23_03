// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:hcm23_03/shared/shared_ui/inputs/input_normal/input_normal.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:hcm23_03/features/tasks/entities/task_details_state.dart';

import '../../../shared/shared_ui/base_screen/base_screen.dart';
import '../entities/task.dart';

class TaskDetailsPage extends StatefulWidget {
  static const String routeName = "/TaskDetailsPage";
  final Task currentTask;

  const TaskDetailsPage({
    Key? key,
    required this.currentTask,
  }) : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  TaskDetailsState state = TaskDetailsState.view;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  void toggleState() {
    setState(() {
      if (state == TaskDetailsState.view &&
          status(widget.currentTask) != TaskProgress.done) {
        state = TaskDetailsState.edit;
      } else {
        state = TaskDetailsState.view;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Task Details",
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: toggleState,
              icon: Icon(
                state == TaskDetailsState.edit
                    ? Icons.check_rounded
                    : Icons.edit,
                size: 20,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                _buildTitle(
                  state,
                  widget.currentTask,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildDuetime(
                  state,
                  widget.currentTask,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildDescription(
                  state,
                  widget.currentTask,
                ),
                const SizedBox(
                  height: 28,
                ),
                _buildStagesOfTask(
                  state,
                  widget.currentTask,
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Column _buildStagesOfTask(
    TaskDetailsState state,
    Task currentTask,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Stages of task",
          style: TextStyle(color: Color(0XFF5D6B98)),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                  color: const Color(0XFF000000).withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: currentTask.taskStages[index].isDone,
                    onChanged: (val) {
                      if (state == TaskDetailsState.edit) {
                        setState(() {
                          currentTask.taskStages[index].isDone = (val == true);
                        });
                      }
                    },
                  ),
                  Expanded(
                    child: Text(
                      currentTask.taskStages[index].description ?? "",
                      style: TextStyle(
                        color: const Color(0xff30374f).withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            );
          }),
          separatorBuilder: (context, idx) => const SizedBox(
            height: 12,
          ),
          itemCount: currentTask.taskStages.length,
        )
      ],
    );
  }

  Column _buildDescription(
    TaskDetailsState state,
    Task currentTask,
  ) {
    descriptionController.text = currentTask.description ?? "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(color: Color(0XFF5D6B98)),
        ),
        const SizedBox(
          height: 12,
        ),
        state == TaskDetailsState.edit
            ? InputNormal(
                controller: descriptionController,
                minLines: 1,
                maxLines: 5,
                valueTextStyle: const TextStyle(
                  color: Color(0XFF111322),
                  fontSize: 14,
                ),
                decoration:
                    const InputDecoration(contentPadding: EdgeInsets.zero),
              )
            : Text(
                currentTask.description ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0XFF111322),
                ),
              ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            SizedBox(
              height: 24,
              width: 71,
              child: Stack(
                children: [
                  ...List.generate(
                    min(currentTask.teamMembers.length, 5),
                    (index) => Positioned(
                      left: 12.0 * index,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              image: DecorationImage(
                                image: NetworkImage(
                                  currentTask.teamMembers[index].avatarUrl ??
                                      "",
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (currentTask.teamMembers.length > 5)
              Text("+${currentTask.teamMembers.length - 5}"),
          ],
        )
      ],
    );
  }

  Column _buildDuetime(
    TaskDetailsState state,
    Task currentTask,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Due date",
          style: TextStyle(color: Color(0XFF5D6B98)),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            const Icon(
              Icons.lock_clock,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              DateFormat("dd/MM/yyyy")
                  .format(widget.currentTask.dueTime ?? DateTime.now()),
              style: const TextStyle(color: Color(0XFF5D6B98)),
            ),
            const Spacer(),
            _buildTaskStatus(widget.currentTask)
          ],
        )
      ],
    );
  }

  TaskProgress status(Task task) {
    int doneTask = 0;
    for (TaskStage stage in task.taskStages) {
      if (stage.isDone == true) {
        doneTask++;
      }
    }
    if ((task.startTime ?? DateTime.now()).isAfter(DateTime.now())) {
      return TaskProgress.imcoming;
    }
    if ((task.dueTime ?? DateTime.now()).isBefore(DateTime.now()) &&
        doneTask < task.taskStages.length) {
      return TaskProgress.failure;
    }
    if (doneTask == task.taskStages.length) {
      return TaskProgress.done;
    }

    return TaskProgress.inProgress;
  }

  Container _buildTaskStatus(Task task) {
    final TaskProgress progress = status(task);

    switch (progress) {
      case TaskProgress.inProgress:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xff039855).withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Text(
            "In progress",
            style: TextStyle(fontSize: 12, color: Color(0xff039855)),
          ),
        );
      case TaskProgress.imcoming:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Text(
            "Comming up",
            style: TextStyle(fontSize: 12, color: Colors.purple),
          ),
        );
      case TaskProgress.failure:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Text(
            "Failed",
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        );

      default:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Text(
            "Done",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        );
    }
  }

  Column _buildTitle(
    TaskDetailsState state,
    Task currentTask,
  ) {
    titleController.text = currentTask.title ?? "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Task title",
          style: TextStyle(color: Color(0XFF5D6B98)),
        ),
        const SizedBox(
          height: 12,
        ),
        state == TaskDetailsState.edit
            ? InputNormal(
                controller: titleController,
                valueTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                decoration:
                    const InputDecoration(contentPadding: EdgeInsets.zero),
              )
            : Row(
                children: [
                  Expanded(
                    child: Text(
                      currentTask.title ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
