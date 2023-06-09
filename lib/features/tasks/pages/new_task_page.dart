import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hcm23_03/shared/shared_ui/inputs/input_normal/input_normal.dart';
import 'package:uuid/uuid.dart';
import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import 'package:hcm23_03/shared/shared_ui/base_screen/base_screen.dart';
import '../widgets/task_stage_input.dart';
import 'package:hcm23_03/features/tasks/entities/task.dart';
import 'package:hcm23_03/features/tasks/entities/task_model.dart';

class NewTaskPage extends StatelessWidget {
  static TextEditingController titleController =
      TextEditingController(text: "Blank titile");
  static TextEditingController desController =
      TextEditingController(text: "Blank description");
  static const String routeName = "/NewTaskPage";

  const NewTaskPage({super.key});

  
         
    
  
  
    
 

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("New Task"),
            backgroundColor: Color.fromARGB(255, 150, 116, 228),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                const SizedBox(
                  height: 28,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task title",
                      style: TextStyle(color: Color(0XFF5D6B98)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputNormal(
                            placeholderText: "Enter task's title",
                            controller: titleController,
                            valueTextStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Start time",
                      style: TextStyle(
                        color: Color(0XFF5D6B98),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Text(
                            DateFormat("dd/MM/yyyy hh:MM")
                                .format(DateTime.now()),
                            style: const TextStyle(color: Color(0XFF5D6B98)),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.lock_clock,
                          size: 16,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Due time",
                      style: TextStyle(
                        color: Color(0XFF5D6B98),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Text(
                            DateFormat("dd/MM/yyyy hh:MM")
                                .format(DateTime.now()),
                            style: const TextStyle(color: Color(0XFF5D6B98)),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.lock_clock,
                          size: 16,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(color: Color(0XFF5D6B98)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: InputNormal(
                          placeholderText: "Enter task's description",
                          controller: desController,
                          minLines: 3,
                          maxLines: 5,
                          valueTextStyle: const TextStyle(
                            color: Color(0XFF111322),
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero),
                        )),
                        
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(),
                  
                  itemBuilder:((context ,index){
                    return ();

                  };
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Stages of task",
                      style: TextStyle(color: Color(0XFF5D6B98)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          
                        },
                        child: const Text("+ Stage"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                BtnDefault(
                  onTap: () {
                  
                  },
                  title: "Save change",
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
