import 'package:flutter/material.dart';

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
  List tasks=['as','asd','asd'];
  List description=['des1', 'des2', 'des3'];

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
                        onPressed: (){},
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
                return ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                          width: 300,
                          child: Text(tasks[index])
                      ),
                      GestureDetector(
                        onTap: (){
                          Dialog d= Dialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
                              child: Container(
                                height: 100,
                                width: 300.0,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text('Are you sure you want to delete this task??'),
                                    Row(
                                      children: [
                                        FlatButton(
                                          child: Text('Yes'),
                                          onPressed: (){
                                            setState(() {
                                              tasks.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),

                                        FlatButton(
                                          child: Text("No"),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                          showDialog(context: context, builder: (BuildContext contex)=>d);
                        },
                          child: Icon(Icons.delete))
                    ],
                  ),
                  subtitle: Text(description[index]),
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