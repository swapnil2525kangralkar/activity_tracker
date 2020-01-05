import 'package:activity_tracker/models/Act.dart';
import 'package:activity_tracker/services/auth_service.dart';
import 'package:activity_tracker/views/home_view.dart';
import 'package:activity_tracker/views/new_acts/date_view.dart';
import 'package:activity_tracker/wigets/provider_widget.dart';
import 'package:flutter/material.dart';

class NewActLocationView extends StatelessWidget {
  final Act act;
  const NewActLocationView({Key key, @required this.act}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();

    _titleController.text = act.title;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create activity'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () async {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => HomeView()));
        //     },
        //   )
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Enter A location"),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: _titleController,
              autofocus: true,
            ),
          ),
          RaisedButton(
            child: Text("Continue"),
            onPressed: () {
              act.title = _titleController.text;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewActDateView(
                            act: act,
                          )));
            },
          )
          // Container(
          //   // child: child,height: 100,
          //   width: 100,
          //   color: Colors.red,
          // ),
        ],
      ),
    );
  }
}
