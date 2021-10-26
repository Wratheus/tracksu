class Beatmap{
  int? beatmapID;
  int? beatmapSetID;
  var difficultyRating;
  var OD;
  var AR;
  var CS;
  var HP;
  var BPM;
  int? maxCombo;
  int? countCircles;
  int? countSliders;
  int? countSpinners;
  var beatmapLength;
  String? difficultyName;
  int? playCount;
  int? passCount;
  String? rankedStatus;
  String? mode;
  String? beatmapURL;
  String? artistName;
  String? coversJPG;
  String? mapTitle;
  String? mapperName;
  int? mapperId;
  int? favouriteCount;
  String? rankedDate;
  String? submittedDate;
  String? beatmapTags;
  Map<String, dynamic>? failCounts;

  Beatmap({
    required this.beatmapID,
    required this.beatmapSetID,
    required this.difficultyRating,
    required this.OD,
    required this.AR,
    required this.CS,
    required this.HP,
    required this.BPM,
    required this.maxCombo,
    required this.countCircles,
    required this.countSliders,
    required this.countSpinners,
    required this.beatmapLength,
    required this.difficultyName,
    required this.playCount,
    required this.rankedStatus,
    required this.mode,
    required this.beatmapURL,
    required this.artistName,
    required this.coversJPG,
    required this.mapTitle,
    required this.mapperName,
    required this.mapperId,
    required this.failCounts,
    required this.favouriteCount,
    required this.beatmapTags,
    required this.passCount,
    required this.rankedDate,
    required this.submittedDate,
  });

  factory Beatmap.fromJson(Map<String, dynamic> json) {
    return Beatmap(
      beatmapID: json['id'],
      beatmapSetID: json['beatmapset_id'],
      difficultyRating: json['difficulty_rating'],
      OD: json['accuracy'],
      AR: json['ar'],
      CS: json['cs'],
      HP: json['drain'],
      BPM: json['bpm'],
      maxCombo: json['max_combo'],
      countCircles: json['count_circles'],
      countSliders: json['count_sliders'],
      countSpinners: json['count_spinners'],
      beatmapLength: json['total_length'],
      beatmapURL: json['url'],
      mode: json['mode'],
      rankedStatus: json['status'],
      difficultyName: json['version'],
      passCount: json['passcount'],
      playCount: json['playcount'],
      artistName: json['beatmapset']['artist'],
      coversJPG: json['beatmapset']['covers']['cover'],
      mapTitle: json['beatmapset']['title'],
      mapperName: json['beatmapset']['creator'],
      mapperId: json['beatmapset']['user_id'],
      favouriteCount: json['beatmapset']['favourite_count'],
      beatmapTags: json['beatmapset']['tags'],
      rankedDate: json['beatmapset']['ranked_date'],
      submittedDate: json['beatmapset']['submitted_date'],
      failCounts: json['failtimes'],
    );
  }
}
