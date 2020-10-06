import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:test_task_app/main.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

  int tag = 1;
  List<String> tags = [];

  List<String> options = [
    'Work', 'Personal', 'Shopping',
    'Health', 'Other',
  ];

  var _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: (){Navigator.pop(context,true);}
        ),
          backgroundColor: Colors.white60,
          elevation: 0,)
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 60),
                border: InputBorder.none,
                hintText: 'Add Task'
            ),
            style: TextStyle(
                color: Colors.black,
                fontSize: 25
            ),
          ),
          FlatButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
                  print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                  _date = date;
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime(2020, 9, 1, 23, 12, 34));
              },
              child: Text(
                'Click to select Date and Time',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )),
          Text('$_date'),
        ChipsChoice<int>.single(
        value: tag,
        options: ChipsChoiceOption.listFrom<int, String>(
        source: options,
        value: (i, v) => i,
        label: (i, v) => v,
        ),
        onChanged: (val) => setState(() => tag = val),
        ),
         TextField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
           decoration: InputDecoration(
               contentPadding: EdgeInsets.only(left: 60),
               border: InputBorder.none,
               hintText: 'Task Description'
           ),
          ),

          RaisedButton(
            onPressed: () {
            },
            child:  Text('Add Task',
            style: TextStyle(fontSize: 20)),)

        ],
      ),
    );
  }
}