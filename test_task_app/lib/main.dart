import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_task_app/Tasks.dart';
import 'package:test_task_app/newTask.dart';

import 'newTask.dart';
import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashScreen(),
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
  Color dataColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // color: Color(0xffe8e8e8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/background1.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Color(0xff173D7B),
                  highlightColor: Color(0xfffe379f),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
                        child: Text(
                          'Just do it!',
                          style:
                              TextStyle(fontFamily: 'Righteous', fontSize: 15),
                        ),
                      )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Hello There',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff173D7B),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Tasks to complete:',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              // color: Colors
              child: ListView.builder(
                itemCount: Task_list.get_list().length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(Task_list.get_list().toString()),
                    onDismissed: (direction) {
                      setState(() {
                        Task_list.remove_item(index);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Task dismissed")));
                      });
                    },
                    background: Container(
                      color: Color(0xff173D7B),
                    ),
                    child: Card(
                      color: Color(0xffAFD7F6),
                      child: ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                  width: 300,
                                  child: Text(
                                    Task_list.get_task_info(index)["task"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30, color: Color(0xff173D7B)),
                                  )),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    Task_list.get_task_info(
                                            index)["task_description"]
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.black54,
                                    )),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Category: ' +
                                    Task_list.get_task_info(index)["task_type"]
                                        .toString()),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Due: ' +
                                    Task_list.get_task_info(index)["task_time"]
                                        .toString()),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              child: Icon(
                Icons.add,
                size: 50,
                color: Colors.white,
              ),
              backgroundColor: Color(0xfffe379f),
              splashColor: Color(0xff173D7B),
              shape: CircleBorder(),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (contex) => NewTask()));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
