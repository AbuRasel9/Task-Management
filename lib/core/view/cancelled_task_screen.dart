import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../common/wdgets/change_status_task.dart';
import '../common/wdgets/task_widget.dart';
import '../models/CancelledTaskModel.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  CancelledTaskModel? _cancelledTaskModel;

  // Future cancelledTastFormApi() async {
  //   final response = await networkRequester().getRequester(Urls.cancelledTask);
  //   if (response['status'] == "success") {
  //     _cancelledTaskModel = CancelledTaskModel.fromJson(response);
  //     setState(() {});
  //   }
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     cancelledTastFormApi();
  //   });
  // }

  //Item delete operation
  // Future deleteItem(id) async {
  //   final response = await networkRequester()
  //       .getRequester("https://task.teamrabbil.com/api/v1/deleteTask/$id");
  //   if (response['status'] == 'success') {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Delete Item Successfull")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(_cancelledTaskModel == null)
          Expanded(child: Center(child: CircularProgressIndicator()))
        else
          Expanded(
          child: RefreshIndicator(
            onRefresh: ()async{
              // cancelledTastFormApi();
            },
            child: ListView.builder(
                itemCount: _cancelledTaskModel?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final task = _cancelledTaskModel!.data![index];
                  return TaskWidget(
                    title: task.title ?? "Unknown",
                    description: task.description ?? "unknown",
                    type: 'Cancelled',
                    onEditTap: () {
                      showModalSheetChangeStatus(context, task.sId ?? "");
                    },
                    onDeleteTap: () {
                      // deleteItem(task.sId);
                    },
                    date: task.createdDate ?? "Unknown",
                  );
                }),
          ),
        ),
      ],
    );
  }
}
