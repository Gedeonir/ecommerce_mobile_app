import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Api extends StatefulWidget{
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api>{
  @override
  Widget build(BuildContext context) {
    List<Student> students=[
      Student(ID: 1,name: "Uwera Ange", Age: 20),
      Student(ID: 2,name: "Nshimyumuremyi Bernard", Age: 25)
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text("API", style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context,index){
          return(
            ListTile(
              leading: CircleAvatar(child: Text(students[index].ID.toString()),),
              title: Text(students[index].name),
              subtitle: Text(students[index].Age.toString()),
            )
          );
        },
      )
    );
  }
}

class Student{
  int ID;
  String name;
  int Age;
  
  Student({required this.ID,required this.name,required this.Age});
}
  