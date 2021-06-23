//before let's add the http package
import 'dart:convert';


import 'package:footballapp/model/player.dart';
import 'package:footballapp/model/soccer.dart';
import 'package:http/http.dart' as http;

class SoccerApi  {

  final String apiUrl = "https://api.football-data.org/v2/matches";
  Future<List<Match>> getAllMatches() async {
    http.Response response = await http.get(
        apiUrl,
        headers: {'X-Auth-Token': '86014f6025ae430dba078acc94bb2647'});
var data=json.decode(response.body);
List<dynamic> matchList=data['matches'];
    print('--------------------hi i am prabesh------------------- ');

    // print(data); // this is print
// print(matchList);
List<Match> matches= matchList.map((dynamic item)=>Match.fromJson(item)).toList();

    print(matches[0].score);//but after convert map data to List is not print

    return matches;

  }

  Future<List<Player>> getAllPlayers(String name) async{

    http.Response response = await http.get('https://www.thesportsdb.com/api/v1/json/1/searchplayers.php?p=${name}');
    var data=json.decode(response.body);
    print('--------------------hi i am Player------------------- ');
    // print(data);

    List<dynamic> playerInfo=data['player'];

    // print(playerInfo);

    List<Player> players=playerInfo.map((item) => Player.fromJson(item)).where((user){
      final nameLower= user.playerName.toLowerCase();
      final queryLower=name.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();


return players;
  }




}
