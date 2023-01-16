import 'package:flutter/material.dart';
class ListStudents extends StatefulWidget {
  List data=[];
   ListStudents({super.key, required this.data});

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Attendance'),),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 16,top: 0),
        child: ListView.builder(
          itemCount: widget.data.length,
            itemBuilder: (context,index){
            Map<String,dynamic> data= widget.data[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListTile(
                title: Text('${data['name']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                subtitle: Row(children: [
                  Text("${data['roll-num']}",style: TextStyle(fontSize: 16),),
                  Spacer(),
                  Text("${data['attendance']}",style: TextStyle(
                      color:data['attendance'].toString().toLowerCase()=='absent'? Colors.red: Colors.blue,
                      fontWeight: FontWeight.bold,fontSize: 16),)
                ],),
              ),
            );
        }),
      ),
    );
  }
}
