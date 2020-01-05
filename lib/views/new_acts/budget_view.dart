import 'package:activity_tracker/models/Act.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewActBudgetView extends StatelessWidget {
  final db = Firestore.instance;
  final Act act;
  NewActBudgetView({Key key, @required this.act}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController _titleController = new TextEditingController();

    // _titleController.text = act.title;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create activity - Date'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Finish"),
          Text("Location ${act.title}"),
          Text("Start date ${act.startDate}"),
          Text("End Date  ${act.endDate}"),
          RaisedButton(
            child: Text("Finish"),
            onPressed: () async {
              await db.collection("acts").add(act.toJson());
              Navigator.of(context).popUntil((route) => route.isFirst);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => NewActDateView()));
            },
          )
        ],
      ),
    );
  }
}
