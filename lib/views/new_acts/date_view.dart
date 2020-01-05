import 'package:activity_tracker/models/Act.dart';
import 'package:activity_tracker/views/new_acts/budget_view.dart';
import 'package:flutter/material.dart';

class NewActDateView extends StatelessWidget {
  final Act act;
  const NewActDateView({Key key, @required this.act}) : super(key: key);

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
          Row(
            children: <Widget>[
              Text("Enter Start Date"),
              Text("Enter End Date"),
            ],
          ),
          RaisedButton(
            child: Text("Continue"),
            onPressed: () {
              act.startDate = DateTime.now();
              act.endDate = DateTime.now();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewActBudgetView(
                            act: act,
                          )));
            },
          )
        ],
      ),
    );
  }
}
