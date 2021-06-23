import 'package:flutter/material.dart';
import 'package:footballapp/model/soccer.dart';
import 'package:footballapp/services/soccer_service.dart';
import 'package:footballapp/ui/Screens/page_body.dart';

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  void initState() {
    super.initState();
// var data=SoccerApi().getAllMatches();
//
// print(data);
// //     print('_________________________________________________--------------');
// //


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",

        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: FutureBuilder(
          future: SoccerApi()
              .getAllMatches(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {

              var userData=snapshot.data;
              print(userData);
              return PageBody(userData);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }, // here we will buil the app layout
        ),
      ),
    );
  }
}
