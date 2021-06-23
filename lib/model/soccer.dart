class Match {
  Match({
    this.id,
    this.competition,
    this.homeTeam,
    this.awayTeam,
    this.score,
    // this.goals,
  });

  int id;
  Competition competition;
  Team homeTeam;
  Team awayTeam;
  Score score;
  // List<Goal> goals=[];

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        competition: Competition.fromJson(json["competition"]),
        homeTeam: Team.fromJson(json["homeTeam"]),
        awayTeam: Team.fromJson(json["awayTeam"]),
        score: Score.fromJson(json["score"]),
        // goals: json["goals"].map((x) => Goal.fromJson(x)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "competition": competition.toJson(),
        "homeTeam": homeTeam.toJson(),
        "awayTeam": awayTeam.toJson(),
        "score": score.toJson(),
        // "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Competition {
  Competition({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Goal {
  Goal({
    this.minute,
    this.type,
    this.team,
    this.scorer,
    this.assist,
  });

  int minute;
  Duration type;
  Competition team;
  Competition scorer;
  Competition assist;

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        minute: json["minute"],
        type: durationValues.map[json["type"]],
        team: Competition.fromJson(json["team"]),
        scorer: Competition.fromJson(json["scorer"]),
        assist: json["assist"] == null
            ? null
            : Competition.fromJson(json["assist"]),
      );

  Map<String, dynamic> toJson() => {
        "minute": minute,
        "type": durationValues.reverse[type],
        "team": team.toJson(),
        "scorer": scorer.toJson(),
        "assist": assist == null ? null : assist.toJson(),
      };
}

enum Duration { REGULAR }

final durationValues = EnumValues({"REGULAR": Duration.REGULAR});

class Score {
  Score({
    this.winner,
    this.duration,
    this.fullTime,
    this.halfTime,
    this.extraTime,
    this.penalties,
  });

  String winner;
  Duration duration;
  ExtraTime fullTime;
  ExtraTime halfTime;
  ExtraTime extraTime;
  ExtraTime penalties;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json["winner"],
        duration: durationValues.map[json["duration"]],
        fullTime: ExtraTime.fromJson(json["fullTime"]),
        halfTime: ExtraTime.fromJson(json["halfTime"]),
        extraTime: ExtraTime.fromJson(json["extraTime"]),
        penalties: ExtraTime.fromJson(json["penalties"]),
      );

  Map<String, dynamic> toJson() => {
        "winner": winner,
        "duration": durationValues.reverse[duration],
        "fullTime": fullTime.toJson(),
        "halfTime": halfTime.toJson(),
        "extraTime": extraTime.toJson(),
        "penalties": penalties.toJson(),
      };
}

class ExtraTime {
  ExtraTime({
    this.homeTeam,
    this.awayTeam,
  });

  int homeTeam;
  int awayTeam;

  factory ExtraTime.fromJson(Map<String, dynamic> json) => ExtraTime(
        homeTeam: json["homeTeam"] == null ? null : json["homeTeam"],
        awayTeam: json["awayTeam"] == null ? null : json["awayTeam"],
      );

  Map<String, dynamic> toJson() => {
        "homeTeam": homeTeam == null ? null : homeTeam,
        "awayTeam": awayTeam == null ? null : awayTeam,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
