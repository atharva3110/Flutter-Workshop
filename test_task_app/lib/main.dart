import 'package:flutter/material.dart';
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
  List tasks=['as','asd','asd2'];
  List description=['de1', 'des2', 'des4'];

  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      tasks.insert(0, nameController.text);
    });
  }

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
                        onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewTask()));},
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
                itemCount: tasks.length,
                itemBuilder: (context, index){
                return Dismissible(
                  key: Key(tasks.toString()),
                  onDismissed: (direction){
                    setState(() {
                      tasks.removeAt(index);
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Task dismissed")));

                    });
                  },
                  background: Container(color: Colors.purpleAccent,),
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: 300,
                            child: Text(tasks[index])
                        ),

                      ],
                    ),
                    subtitle: Text(description[index]),
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

