import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footballapp/services/soccer_service.dart';

class ClubInfo extends StatefulWidget {
  Map data;
  ClubInfo({this.data});

  @override
  _ClubInfoState createState() => _ClubInfoState();
}

class _ClubInfoState extends State<ClubInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.data);
    print(widget.data);
    // SoccerApi().getAllMatches();
    // print('------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          SvgPicture.network(
            widget.data['team']['crestUrl'],
            height: 250,
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.data['team']['name'].toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Played Games:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.data['playedGames'].toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Won:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.data['won'].toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Draw:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.data['draw'].toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lost:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.data['lost'].toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('points:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.data['points'].toString()),
              ),
            ],
          ),
        ],
      ),
    )
        // FutureBuilder(builder: (context, snapshot) {
        //   if (snapshot.hasData) {
        //     return Column(
        //       children: [
        //         SvgPicture.network(
        //           widget.data['team']['crestUrl'],
        //           height: 30,
        //           width: 30,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: widget.data['team']['name'].toString().length > 12
        //               ? Text(widget.data['team']['name']
        //                       .toString()
        //                       .substring(0, 12) +
        //                   '...')
        //               : Text(widget.data['team']['name'].toString()),
        //         ),
        //       ],
        //     );
        //   }
        //   return Center(child: CircularProgressIndicator());
        // }),
        );
  }
}
