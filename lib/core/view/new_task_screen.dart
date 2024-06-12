import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../common/wdgets/change_status_task.dart';
import '../common/wdgets/summery_card.dart';
import '../common/wdgets/task_widget.dart';
import '../models/completed_task_model.dart';
import '../models/new_task_model.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  CompletedTaskModel? _completedTaskModel;

  NewTaskModel? _newTaskModel;

  //form api we get all new task
  // Future getNewTaskFormApi() async {
  //   final response = await networkRequester().getRequester(Urls.newTask);
  //   if (response['status'] == 'success') {
  //     _newTaskModel = NewTaskModel.fromJson(response);
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // getNewTaskFormApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.green,
          child: const Row(
            children: [

              //re useable summery card
              Expanded(
                  child: CountTaskItem(
                count: 23,
                title: 'New',
              )),
              Expanded(
                  child: CountTaskItem(
                count: 23,
                title: 'Completed Task',
              )),
              Expanded(
                  child: CountTaskItem(
                count: 23,
                title: 'Progress',
              )),
              Expanded(
                  child: CountTaskItem(
                count: 23,
                title: 'Cancelled',
              )),
            ],
          ),
        ),

        if (_newTaskModel == null)
          const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // getNewTaskFormApi();
              },
              child: ListView.builder(
                  itemCount: _newTaskModel?.data?.length,
                  itemBuilder: (context, index) {
                    final task = _newTaskModel!.data![index];

                    return TaskWidget(
                      title: task.title ?? "Unknown",
                      description: task.description ?? "Unknown",
                      type: "New",
                      date: task.createdDate ?? "Unknown",
                      onEditTap: () {
                        showModalSheetChangeStatus(context, task.sId ?? "");
                      },
                      onDeleteTap: () {
                        // deleteItem(task.sId);
                      },
                    );
                  }),
            ),
          ),
      ],
    );
  }
}
