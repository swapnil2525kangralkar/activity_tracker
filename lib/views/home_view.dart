import 'package:activity_tracker/models/Act.dart';
import 'package:activity_tracker/services/auth_service.dart';
import 'package:activity_tracker/views/new_acts/location_view.dart';
import 'package:activity_tracker/wigets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:travel_budget/widgets/provider_widget.dart';
// import 'package:travel_budget/models/Trip.dart';
// import 'detail_trip_view.dart';

class HomeView extends StatelessWidget {
  final List<Act> actsList = [
    Act("Test 1", DateTime.now(), DateTime.now(), 200, null, "tets1"),
    Act("Test 2", DateTime.now(), DateTime.now(), 200, null, "tets2"),
    Act("Test 3", DateTime.now(), DateTime.now(), 200, null, "tets3"),
    Act("Test 4", DateTime.now(), DateTime.now(), 200, null, "tets4"),
    Act("Test 5", DateTime.now(), DateTime.now(), 200, null, "tets5"),
    Act("Test 6", DateTime.now(), DateTime.now(), 200, null, "tets6"),
  ];
  final newAct = new Act(null, null, null, null, null, null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewActLocationView(
                            act: newAct,
                          )));
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: actsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index),
        ),
      ),
    );
  }

//   Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
//       BuildContext context) async* {
//     final uid = await Provider.of(context).auth.getCurrentUID();
//     yield* Firestore.instance
//         .collection('userData')
//         .document(uid)
//         .collection('trips')
//         .snapshots();
//   }

  Widget buildTripCard(BuildContext context, int index) {
    // final trip = Act.fromSnapshot(document);
    // final tripType = trip.types();
    final act = actsList[index];
    // final tripType = trip.types();

    return new Container(
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Text(
                      act.title,
                      style: new TextStyle(fontSize: 30.0),
                    ),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
                  child: Row(children: <Widget>[
                    Text(
                        "${DateFormat('dd/MM/yyyy').format(act.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(act.endDate).toString()}"),
                    Spacer(),
                  ]),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                //   child: Row(
                //     children: <Widget>[
                //       Text(
                //         "\$${(trip.budget == null) ? "n/a" : trip.budget.toStringAsFixed(2)}",
                //         style: new TextStyle(fontSize: 35.0),
                //       ),
                //       Spacer(),
                //       (tripType.containsKey(trip.travelType))
                //           ? tripType[trip.travelType]
                //           : tripType["other"],
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          onTap: () {
            print("detailed view");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => DetailTripView(trip: act)),
            // );
          },
        ),
      ),
    );
  }
}
