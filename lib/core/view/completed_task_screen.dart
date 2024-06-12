import 'package:flutter/material.dart';

import '../common/wdgets/task_widget.dart';
import '../models/completed_task_model.dart';


class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  CompletedTaskModel? _completedTaskModel;

  // Future completedTaskFormApi() async {
  //   final response=await networkRequester().getRequester(Urls.completedTask);
  //   if(response["status"]=="success"){
  //     _completedTaskModel=CompletedTaskModel.fromJson(response);
  //     setState(() {
  //
  //     });
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // completedTaskFormApi();
    });
  }


  // //Item delete operation
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
        if(_completedTaskModel == null)
          Expanded(child: const Center(child: CircularProgressIndicator(),))
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: ()async{
                // completedTaskFormApi();
              },
              child: ListView.builder(
                itemCount: _completedTaskModel?.data?.length ??0,

                itemBuilder: (context,index){
                final task=_completedTaskModel!.data![index];


              return  TaskWidget(
                title: task.title ?? "Unknown",
                description: task.description ?? "Unknown",
                type: 'Completed',
                onEditTap: () {},
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
