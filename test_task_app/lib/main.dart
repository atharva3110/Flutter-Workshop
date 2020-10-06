import 'package:flutter/material.dart';
import 'package:test_task_app/Tasks.dart';
import 'package:test_task_app/newTask.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;

  const MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  TextEditingController nameController = TextEditingController();
  Color dataColor= Colors.greenAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: Column(
          children: [
            Container(
             height: 120,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[200],
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 80, 10),
                      child: Column(

                        children: [
                          Text('Hello Gaurang!!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),
                          ),
                          Text('Today you have 12 tasks',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 55,
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=>NewTask()));
                        },
                        color: Colors.pink,
                          splashColor: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ),
                    )
                  ],
                ),
              ),
             ),

            Container(
              color: Colors.amber,
              height: 190,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(33, 10, 20, 10),
                          child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: dataColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Text('16                         ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                                ),
                                Text('tasks completed')
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                          child: Container(

                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: dataColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(33, 10, 20, 10),
                          child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: dataColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                          child: Container(

                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: dataColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(33, 10, 20, 10),
                          child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: dataColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                          child: Container(

                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: dataColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 281,
              color: Colors.pinkAccent[100],
              child: ListView.builder(
                itemCount: Task_list.get_list().length,
                itemBuilder: (context, index){
                return Dismissible(

                  key: Key(Task_list.get_list().toString()),
                  onDismissed: (direction){
                    setState(() {
                      Task_list.remove_item(index);
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Task dismissed!!")));

                    });
                  },
                  background: Container(color: Colors.purpleAccent,),
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: 300,
                            child: Text(Task_list.get_task_info(index)["task"].toString())
                        ),
                      ],
                    ),
                    subtitle: Row(children: [
                      Text(Task_list.get_task_info(index)["task_description"].toString()),
                      Text(Task_list.get_task_info(index)["task_type"].toString()),
                      Text(Task_list.get_task_info(index)["task_time"].toString())
                    ],)
                  ),
                );
                },
              ),
            )
          ],
        ),

      ),
    );
  }
}

