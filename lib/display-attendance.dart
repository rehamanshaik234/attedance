import 'package:attedance/upload_attedance.dart';
import 'package:attedance/list-students.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
class DisplayAttendance extends StatefulWidget {
  const DisplayAttendance({Key? key}) : super(key: key);

  @override
  State<DisplayAttendance> createState() => _DisplayAttendanceState();
}

class _DisplayAttendanceState extends State<DisplayAttendance> {
  final firebase= FirebaseFirestore.instance.collection('attendance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dates'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firebase.snapshots(),
        builder: ( context, snapshot) {
          int? index=snapshot.data?.docs.length;
          return index==null||index==0? Center(
            child: Container(
              child: Text('No Data Found',style: TextStyle(color: Colors.blue),),
            ),
          ): ListView.builder(
              itemCount: index,
              itemBuilder: (context,index){
                var data= snapshot.data!.docs[index].data() as Map<String,dynamic>;
                List studentData= data['students'] as List;
                var date=Jiffy("${data['createdAt']}").yMMMd;
                print(studentData.toString());
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListStudents(data:studentData)));
                    },
                    child: Card(
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(date,style: TextStyle(color: Colors.blue),),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_sharp,color: Colors.blue,)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Attendance()));

      },tooltip: "upload Attendance",
        child:Icon(Icons.add,color: Colors.white,) ,),
    );
  }
}
