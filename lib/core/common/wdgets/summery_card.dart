// import 'package:flutter/material.dart';
// Card buildSummeryCard(int count,String title) {
//   return Container(
//
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//
//         Text(count.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
//         const SizedBox(height: 5,),
//         FittedBox(child: Text("$title Task")),
//       ],
//     ),
//   );
// }
import 'package:flutter/material.dart';

class CountTaskItem extends StatelessWidget {
  final int count;
  final String title;

  const CountTaskItem({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            count.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(child: Text("$title Task")),
        ],
      ),
    );
  }
}
