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
  double?gainedPP;
  int?beatmapSetId;
  int?beatmapSetMapId;
  double?difficultyRating;
  int?beatmapLength;
  String?difficultyName;
  int?OD;
  double?AR;
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
  factory Scores.fromJson(List<dynamic> json){
    return Scores(
      scoreId: json[0]['id'],
      mods: json[0]['mods'],
      scorePoints: json[0]['score'],
      maxCombo: json[0]['max_combo'],
      mapStatistics: json[0]['statistics'],
      mapRank: json[0]['rank'],
      dateOfScore: json[0]['created_at'],
      bestScoreOnMapId: json[0]['best_id'],
      gainedPP: json[0]['pp'],
      difficultyName: json[0]['beatmap']['version'],
      beatmapSetId: json[0]['beatmap']['beatmapset_id'],
      difficultyRating: json[0]['beatmap']['difficulty_rating'],
      beatmapSetMapId: json[0]['beatmap']['id'],
      beatmapLength: json[0]['beatmap']['total_length'],
      OD: json[0]['beatmap']['accuracy'],
      AR: json[0]['beatmap']['ar'],
      BPM: json[0]['beatmap']['bpm'],
      CS: json[0]['beatmap']['cs'],
      HP: json[0]['beatmap']['drain'],
      beatmapURL: json[0]['beatmap']['url'],
      artistName: json[0]['beatmapset']['artist'],
      coversJPG: json[0]['beatmapset']['covers']['cover'],
      mapTitle: json[0]['beatmapset']['title'],
      mapperName: json[0]['beatmapset']['creator'],
      mapperId: json[0]['beatmapset']['user_id'],
    );
  }
}