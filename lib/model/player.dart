class Player{

  String playerName;
  String  team;
  String nationality;
  DateTime dateTime;
 String playerNumber;
  String birthdate;
  String description;
  String playerPicture;

  Player({this.playerName, this.team, this.nationality, this.dateTime,
    this.playerNumber, this.birthdate, this.description, this.playerPicture});

 factory Player.fromJson(Map<String,dynamic> json){

    return Player(
      playerName: json['strPlayer'],
      team: json['strTeam'],
      nationality: json['strNationality'],
      dateTime: DateTime.parse(json['dateBorn']),
      description: json['strDescriptionEN'],
      playerNumber: json['strNumber'],
      playerPicture: json['strCutout']

    );





  }


}