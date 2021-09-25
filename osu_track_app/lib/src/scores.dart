// Score includes beatmap class to avoid beatmap request
class Scores{
  int?scoreId;
  List<dynamic> mods = [];
  int?scorePoints;
  int?maxCombo;
  Map<String, dynamic>?mapStatistics;
  String?mapRank;
  String?dateOfScore;
  int?bestScoreOnMapId;
  int?gainedPP;
  int?beatmapSetId;
  int?beatmapSetMapId;
  int?difficultyRating;
  int?beatmapLength;
  String?difficultyName;
  int?OD;
  int?AR;
  int?BPM;
  int?CS;
  int?HP;
  String?beatmapURL;
  String?artistName;
  String?coversJPG;
  String?mapTitle;
  String?mapperName;
  int?mapperId;

  Scores({
    required this.scoreId,
    required this.mods,
    required this.scorePoints,
    required this.maxCombo,
    required this.mapStatistics,
    required this.mapRank,
    required this.dateOfScore,
    required this.bestScoreOnMapId,
    required this.gainedPP,
    required this.beatmapSetId,
    required this.beatmapSetMapId,
    required this.difficultyRating,
    required this.beatmapLength,
    required this.difficultyName,
    required this.OD,
    required this.AR,
    required this.BPM,
    required this.CS,
    required this.HP,
    required this.beatmapURL,
    required this.artistName,
    required this.coversJPG,
    required this.mapTitle,
    required this.mapperName,
    required this.mapperId
  });
  factory Scores.fromJson(Map<String, dynamic> json){
    return Scores(
      scoreId: json['id'],
      mods: json['mods'],
      scorePoints: json['score'],
      maxCombo: json['max_combo'],
      mapStatistics: json['statistics'],
      mapRank: json['rank'],
      dateOfScore: json['created_at'],
      bestScoreOnMapId: json['best_id'],
      gainedPP: json['pp'],
      difficultyName: json['beatmap']['version'],
      beatmapSetId: json['beatmap']['beatmapset_id'],
      difficultyRating: json['beatmap']['difficulty_rating'],
      beatmapSetMapId: json['beatmap']['id'],
      beatmapLength: json['beatmap']['total_length'],
      OD: json['beatmap']['accuracy'],
      AR: json['beatmap']['ar'],
      BPM: json['beatmap']['bpm'],
      CS: json['beatmap']['cs'],
      HP: json['beatmap']['drain'],
      beatmapURL: json['beatmap']['url'],
      artistName: json['beatmapset']['artist'],
      coversJPG: json['beatmapset']['covers']['cover'],
      mapTitle: json['beatmapset']['title'],
      mapperName: json['beatmapset']['creator'],
      mapperId: json['beatmapset']['user_id'],
    );
  }
}