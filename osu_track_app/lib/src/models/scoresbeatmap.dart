// Score includes beatmap class to avoid beatmap request
class BeatmapScores{
  int? scoreId;
  List<dynamic> mods = [];
  var scorePoints;
  var accuracy;
  int? maxCombo;
  Map<String, dynamic>?mapStatistics;
  String? mapRank;
  String? dateOfScore;
  int? bestScoreOnMapId;
  var gainedPP;

  BeatmapScores({
    required this.scoreId,
    required this.accuracy,
    required this.mods,
    required this.scorePoints,
    required this.maxCombo,
    required this.mapStatistics,
    required this.mapRank,
    required this.dateOfScore,
    required this.bestScoreOnMapId,
    required this.gainedPP,
  });
  factory BeatmapScores.fromJson(Map<String, dynamic> json){
    return BeatmapScores(
      scoreId: json['id'],
      accuracy: json['accuracy'],
      mods: json['mods'],
      scorePoints: json['score'],
      maxCombo: json['max_combo'],
      mapStatistics: json['statistics'],
      mapRank: json['rank'],
      dateOfScore: json['created_at'],
      bestScoreOnMapId: json['best_id'],
      gainedPP: json['pp'],
    );
  }
}