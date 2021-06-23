import 'package:flutter/material.dart';
import 'package:footballapp/model/soccer.dart';
import 'package:footballapp/ui/Widgets/goal_stat.dart';
import 'package:footballapp/ui/Widgets/match_tile.dart';
import 'package:footballapp/ui/Widgets/team_stat.dart';



Widget PageBody(List<Match> allmatches) {
  print(allmatches[0].homeTeam.name);
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                teamStat("Local Team",
                    allmatches[0].homeTeam.name),
                goalStat(allmatches[0].score.winner.toString(),
                    allmatches[0].score.fullTime.homeTeam, allmatches[0].score.fullTime.awayTeam),
                teamStat("Visitor Team",
                  allmatches[0].awayTeam.name,
                )
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0)
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "MATCHES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allmatches.length,
                      itemBuilder: (context, index) {
                        return matchTile(allmatches[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}
