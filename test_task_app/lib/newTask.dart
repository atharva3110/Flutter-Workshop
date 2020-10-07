import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:test_task_app/main.dart';
import 'package:test_task_app/Tasks.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  int tag = 1;
  List<String> tags = [];
  String task_name, task_description, task_type;
  List<String> options = [
    'Work',
    'Personal',
    'Shopping',
    'Health',
    'Other',
  ];

  var _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          ListTile(
            trailing: FlatButton(
                child: Icon(
                  Icons.cancel,
                  size: 30,
                  color: Colors.black45,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Add Task',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
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
                'Tackle your goals in daily doses',
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Name the task',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'e.g. Learn Flutter',
                labelStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
              onChanged: (task) => {task_name = task},
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Description',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'e.g. Code-Along',
                labelStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
              onChanged: (des) => {task_description = des},
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Date and Time',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          ListTile(
            leading: FlatButton(
              child: Icon(Icons.calendar_today),
              onPressed: () {
                DatePicker.showDateTimePicker(context, showTitleActions: true,
                    onChanged: (date) {
                  print('change $date in time zone ' +
                      date.timeZoneOffset.inHours.toString());
                  _date = date;
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime(2020, 9, 1, 23, 12, 34));
              },
            ),
            trailing: Text('$_date'),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          ChipsChoice<int>.single(
            value: tag,
            options: ChipsChoiceOption.listFrom<int, String>(
              source: options,
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            onChanged: (val) => setState(() => tag = val),
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            onPressed: () {
              Task_list list = Task_list();
              Task task = Task(
                  task_name, task_description, options[tag], _date.toString());
              Task_list.add_to_list(task);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            color: Colors.blue,
            splashColor: Color(0xff020061),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Text(
                'Save Task',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
