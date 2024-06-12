import 'package:flutter/material.dart';

import '../common/wdgets/change_status_task.dart';
import '../common/wdgets/task_widget.dart';
import '../models/inprogress_task_model.dart';


class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({super.key});

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
  ProgressTaskModel? _progressTaskModel;

  // Future inprogressgetFormApi() async {
  //   final response = await networkRequester().getRequester(
  //       "https://task.teamrabbil.com/api/v1/listTaskByStatus/Progress");
  //   if (response['status'] == "success") {
  //     _progressTaskModel = ProgressTaskModel.fromJson(response);
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // inprogressgetFormApi();
    });
  }


  //Item delete operation
  // Future deleteItem(id) async {
  //   final response=await networkRequester().getRequester("https://task.teamrabbil.com/api/v1/deleteTask/$id");
  //   if(response['status']=='success'){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete Item Successfull")));
  //
  //   }
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(_progressTaskModel == null)
          Expanded(child: Center(child: CircularProgressIndicator()))
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: ()async{
                // inprogressgetFormApi();

              },
              child: ListView.builder(
                itemCount: _progressTaskModel?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final tasks = _progressTaskModel!.data![index];
                  return TaskWidget(
                    title: tasks.title ?? "unknown",
                    description: tasks.description ?? "unknown",
                    type: 'Inprogress',
                    onEditTap: () {
                      showModalSheetChangeStatus(context, tasks.sId ?? "");
                    },
                    onDeleteTap: () {
                      // deleteItem(tasks.sId);
                    },
                    date: tasks.createdDate ?? "unknown",
                  );
                }),
            ),
          ),
      ],
    );
  }
}
