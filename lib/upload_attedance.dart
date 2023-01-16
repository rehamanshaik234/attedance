import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List items=["Present",'Absent'];
  String? attendance;
  List studentsData=[];
  DateTime dateTime=DateTime(2023,10,5);
  TextEditingController name= TextEditingController();
  TextEditingController rollNum= TextEditingController();
  final firebase= FirebaseFirestore.instance.collection('attendance').doc('${DateTime.now().toString().substring(0,10)}');
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: name,
                  maxLines: 1,
                  keyboardType:TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Student Name'),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: rollNum,
                  maxLines: 1,
                  keyboardType:TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Student Roll Number'),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 16.0,bottom: 16,left:0,right: 0 ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: DropdownButton2(
                    hint: const Text(
                      'Select Attendance',
                      style: TextStyle(
                          fontSize: 18,
                          color:Colors.black
                      ),
                    ),
                    items: items
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black
                            ),
                          ),
                        ))
                        .toList(),
                    value: attendance,
                    onChanged: (value) {
                      setState(() {
                        attendance = value as String;
                      });
                    },
                    dropdownOverButton: true,
                    dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,width: 2)

                    ),
                    buttonHeight: 40,
                    buttonWidth: MediaQuery.of(context).size.width,
                    buttonPadding: EdgeInsets.all(10),
                    scrollbarAlwaysShow: true,
                    itemHeight: 40,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                    var data={
                      'name': name.text,
                      'roll-num':rollNum.text,
                      'attendance': attendance
                    };
                    studentsData.add(data);
                    setState(() {
                      name.text='';
                      rollNum.text='';
                      attendance=null;
                    });

                  },
                  child: Text('Add Student'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                    Map<String,dynamic> data= {
                      'year':'4th year',
                      'section':'D',
                      'students':studentsData,
                      "createdAt":DateTime.now().toString().substring(0,10)
                    };
                    firebase.set(data);
                  },
                  child: Text('Upload Attendance'),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
/*
StreamBuilder<QuerySnapshot>(
        stream: firebase.snapshots(),
        builder: ( context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
              var data= snapshot.data!.docs[index].data() as Map<String,dynamic>;
            return ListTile(
              title: Text(data['name'].toString(),style: TextStyle(color: Colors.blue),),
              subtitle: Text(data['roll-num'].toString()),
            );
          });
        },

      )
 */
}